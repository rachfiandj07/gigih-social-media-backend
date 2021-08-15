require 'sinatra'
require 'json'

set :prefix, 'api/v1'

before do
    content_type :json
end