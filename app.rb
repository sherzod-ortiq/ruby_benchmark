require 'sinatra'
require 'sinatra/base'
require 'sinatra/json'
require 'sinatra/activerecord'
require './worker'
Dir["#{Dir.pwd}/models/*.rb"].each { |file| require file }

class RubyBenchmark < Sinatra::Base

	configure :test, :development do
		set :database_file, './config/database.yml'
		set :logging, true
	end

	configure :production do
		set :database_file, './config/database.yml'
		set :logging, true

		# All the logs are redirected to file.
		logfile = File.new("./log/web-#{environment}.log", "a")
		$stdout.reopen(logfile)
		$stderr.reopen(logfile)
		$stderr.sync = true
		$stdout.sync = true
	end

	get '/benchmark' do
		params[:id].present? ? json(BenchmarkInfo.find(params[:id])) : json(BenchmarkInfo.all)
	end
	
	post '/benchmark' do
		if params[:file].present?
			code = params[:file][:tempfile].read
			benchmark_info  = BenchmarkInfo.create(file_name: params[:file][:filename], benchmark_status: "on process")
			BenchmarkWorker.perform_async(benchmark_info.id, code)
			json({benchmark_info_id: benchmark_info.id})
		else
			json({error:"No file"})
		end
	end	

end