# frozen_string_literal: true

require_relative '../models/users'

class UsersController
  def register(params)
    users = Users.new(params)

    if users.register == 200
        return {
            'message' => 'Success',
            'status' => 200,
            'method' => 'POST',
            'data' => params
        }
    else
        return {
            'message' => 'Failed',
            'status' => 401,
            'method' => 'POST',
            'data' => params
        }
    end
  end
end
