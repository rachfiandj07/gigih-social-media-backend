# frozen_string_literal: true

require 'sinatra'
require "sinatra/namespace"
require 'json'

# controller import
require_relative './controllers/usersController'

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
