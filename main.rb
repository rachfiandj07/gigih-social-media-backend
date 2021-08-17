require 'sinatra'
require 'json'

# controller import
require_relative './controllers/usersController'

set :prefix, '/api/v1'

before do
  content_type :json
end

namespace "#{settings.prefix}/user" do
  post '/register' do
    controller = UsersController.new
    response = controller.register(params)

    return response.to_json
  end
end
