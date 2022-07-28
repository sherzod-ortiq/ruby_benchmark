# Ruby benchmark

## Description
Ruby benchmark app built with Ruby and Sinatra.<br>
Post ruby code in txt file and get benchmark results.<br>
App consists of 4 Docker containers: 1 - Sinatra app, 2 - sidekiq worker,<br>
3 - redis database, 4 - postgres database. <br>
The volume binding is used in development to map container files and folders to host machine.<br>
Volume binding makes it possible to exclude files from mapping.<br>
There are separate Docker and Docker compose files for development and test environments.<br>

## Tech stack
Docker<br>
Docker compose<br>
Ruby<br>
Sinatra<br>
Sidekiq<br>
Postgres<br>
Redis<br>

## How to make it work

**For development environment:**<br>
cd to project root folder.<br>
We have 4 containers in development environment.<br>
Create images + create and run containers:<br>
`docker-compose -f ./docker-compose-dev.yml up`<br>
Stop and remove containers:<br>
`docker-compose -f ./docker-compose-dev.yml down`<br>
Rebuild images + create and run containers:<br>
`docker-compose -f ./docker-compose-dev.yml up --build`<br>
List services:<br>
`docker-compose -f ./docker-compose-dev.yml ps`<br>

### Route to benchmark ruby script:
	localhost:3000/benchmark
Post ruby script in txt file
Returns benchmark id for received script

### Route to get a benchmark info:
	localhost:3000/benchmark?id=<benchmark id>

### Route to get all benchmark info:
	localhost:3000/benchmark
