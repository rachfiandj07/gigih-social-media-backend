# gojek-social-media-backend

Gojek Social Media Backend Project

### Introduction

Developing a social media application which can be used to share information with other people. This application will only be used by people that work in a certain company so we cannot use existing public social media. Using Sinatra

### Project Structure
`
.
|-- ./spec.md
|-- ./LICENSE
|-- ./spec
|   |-- ./spec/config
|   |   `-- ./spec/config/connection_spec.rb
|   |-- ./spec/spec_helper.rb
|   |-- ./spec/test_helper.rb
|   |-- ./spec/models
|   |   |-- ./spec/models/users_spec.rb
|   |   |-- ./spec/models/hashtags_spec.rb
|   |   |-- ./spec/models/post_hashtags_spec.rb
|   |   `-- ./spec/models/posts_spec.rb
|   `-- ./spec/controllers
|       |-- ./spec/controllers/post_hashtagsController_spec.rb
|       |-- ./spec/controllers/postController_spec.rb
|       `-- ./spec/controllers/usersController_spec.rb
|-- ./public
|-- ./Gemfile.lock
|-- ./main.rb
|-- ./config.ru
|-- ./setup.sh
|-- ./config
|   `-- ./config/connection.rb
|-- ./mysql-docker.sh
|-- ./Gemfile
|-- ./docker-compose.yml
|-- ./Dockerfile
|-- ./controllers
|   |-- ./controllers/post_hashtagsController.rb
|   |-- ./controllers/postController.rb
|   `-- ./controllers/usersController.rb
|-- ./models
|   |-- ./models/hashtags.rb
|   |-- ./models/post_hashtags.rb
|   |-- ./models/posts.rb
|   `-- ./models/users.rb
|-- ./README.md
`-- ./coverage 
### Installation Run without Docker

1. Fork and clone repo to your local machine
2. Use `bundle install` to install dependencies.
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

1. run `sh setup.sh`
2. run `docker ps` to make sure your app running locally
3. Access your app through `localhost:4567/`

### Installation run with Docker Single Container with MySql

1. run `docker-compose run app sinatra new . --force --database=mysql --skip-bundle `
2. run `sh mysql-docker.sh`
3. run `docker-compose build`
4. run `docker-compose up`
5. access your app through `localhost:4567/`

### Schema Design

![alt text](https://github.com/rachfiandj07/gojek-social-media-backend/blob/main/social-media-db-schema-design%20(1)%20(1).png)