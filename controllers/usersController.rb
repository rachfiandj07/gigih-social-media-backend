require_relative '../models/users.rb'
require_relative '../app/helpers/customSuccessMessage.rb'

class UsersController

    def register(params)
        users = Users.new(params)
        customMessage = CustomSuccessMessage.new
        users.register

        return {
            "message" => customMessage.message,
            "status" => customMessage.status,
            "data" => params
        }
    end
end