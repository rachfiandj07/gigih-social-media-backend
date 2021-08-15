require_relative '../models/users.rb'
require_relative '../app/helpers/customSuccessMessage.rb'

class UsersController

    def register(params)
        users = Users.new(params)
        customMessage = CustomSuccessMessage.new("Success", 200, "POST")
        users.register

        return {
            "message" => customMessage.message,
            "status" => customMessage.status,
            "method" => customMessage.method,
            "data" => params
        }
    end
end