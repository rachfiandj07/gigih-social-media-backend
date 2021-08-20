# frozen_string_literal: true

require_relative '../models/users'

class UsersController
  def register(params)
    array = Array.new
    users = Users.new(params)
    if users.register == 200
      users.get_new_user.each do |res|
        array.push(res)
      end
      {
        'message' => 'Success',
        'status' => 200,
        'method' => 'POST',
        'data' => array
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
