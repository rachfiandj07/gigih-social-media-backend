# frozen_string_literal: true

require 'sinatra'
require "sinatra/namespace"
require 'json'

# controller import
require_relative './controllers/usersController'
require_relative './controllers/post_hashtagsController.rb'
require_relative './controllers/postController.rb'

set :prefix, '/api/v1'

before do
  content_type :json
end

namespace "#{settings.prefix}/user" do
  controller = UsersController.new
  post '/register' do
    response = controller.register(params)
    status response['status']
    return response.to_json
  end
end

namespace "#{settings.prefix}/hashtags" do
    controller = PostHashtagsController.new
    post '/details' do
      response = controller.search_post_hashtag(params)
      status response['status']
      return response.to_json
    end

    get '/trending' do
      response = controller.get_list_trending
      status response['status']
      return response.to_json
    end
end

namespace "#{settings.prefix}/post" do
  controller = PostController.new
  post '/create' do
    response = controller.create_post(params)
    status response['status']
    return response.to_json
  end
end
