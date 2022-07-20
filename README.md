# Ruby benchmark

### Setup development environment
Run:

	docker-compose -f docker-compose-dev.yml up --build
	docker-compose -f docker-compose-dev.yml run web rake db:create
	docker-compose -f docker-compose-dev.yml run web rake db:migrate

### Route to benchmark ruby script:
	localhost:3000/benchmark
Post ruby script in txt file
Returns benchmark id for received script

### Route to get a benchmark info:
	localhost:3000/benchmark?id=<benchmark id>

### Route to get all benchmark info:
	localhost:3000/benchmark
