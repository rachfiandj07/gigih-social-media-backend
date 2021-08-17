# frozen_string_literal: true

require_relative '../models/users'

class UsersController
  def register(params)
    users = Users.new(params)

    if users.register == 200
      {
        'message' => 'Success',
        'status' => 200,
        'method' => 'POST',
        'data' => params
      }
    else
      {
        'message' => 'Failed',
        'status' => 400,
        'method' => 'POST'
      }
    end
  end
end
