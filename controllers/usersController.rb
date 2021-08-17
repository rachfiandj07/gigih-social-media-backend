# frozen_string_literal: true

require_relative '../models/users'
require_relative '../app/helpers/customSuccessMessage'

class UsersController
  def register(params)
    users = Users.new(params)
    customMessage = CustomSuccessMessage.new('Success', 200, 'POST')
    users.register

    {
      'message' => customMessage.message,
      'status' => customMessage.status,
      'method' => customMessage.method,
      'data' => params
    }
  end
end
