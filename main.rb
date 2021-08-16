require 'sinatra'
require 'json'

# controller import
require_relative './controllers/usersController'

set :prefix, '/api/v1'

before do
  content_type :json
end

post "#{settings.prefix}/user/register" do
  controller = UsersController.new
  response = controller.register(params)

  return response.to_json
end
