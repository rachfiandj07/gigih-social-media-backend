# gojek-social-media-backend

Gojek Social Media Backend Project

### Introduction

Developing a social media application which can be used to share information with other people. This application will only be used by people that work in a certain company so we cannot use existing public social media. Using Sinatra

### Project Structure

![alt text](https://github.com/rachfiandj07/gojek-social-media-backend/blob/main/Screen%20Shot%202021-08-21%20at%2000.00.57.png)
### Installation Run without Docker

1. Fork and clone repo to your local machine
2. Use `bundle install` to install dependencies or Use `bundle install --path vendor/bundle`
3. Create `.env` file based on `.env.example`
4. `source .env` file
5. Run with `ruby main.rb` or `rackup -p 4567`
### Running Linter

`rubocop -a` or `rubocop --auto-correct-all`

### Commit Guidelines

There are 4 commit type :

1. `[TEST]` : This shows test commit
2. `[FEATURE]` : This shows feature is developed first rather than test first
3. `[DEPENDENCIES]` : This shows adding dependencies such as Collection , Schema or etc..
4. `[HELPERS]` : This shows helper class is developed

### Run Unit Testing

1. run `rspec -f d` should run all test

### Installation run with Docker Single Container

1. run `sh ./lib/setup.sh`
2. run `docker ps` to make sure your app running locally
3. Access your app through `localhost:4567/`

### Installation run with Docker Single Container with MySql

1. run `docker-compose run app sinatra new . --force --database=mysql --skip-bundle `
2. run `sh ./lib/mysql-docker.sh`
3. run `docker-compose build`
4. run `docker-compose up`
5. access your app through `localhost:4567/`

### Schema Design

![alt text](https://github.com/rachfiandj07/gigih-social-media-backend/blob/main/assets/social-media-db-schema-design%20(1)%20(1).png)

## Production URL

You can access here the production on
`http://34.92.229.122:4567/`
