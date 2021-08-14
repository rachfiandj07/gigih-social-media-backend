class Users
    attr_accessor :username, :bio, :email

    def initialize(username, bio, email)
        @username = username
        @bio = bio
        @email = email
    end

    def valid?
        return false if @username.nil?

        true
    end
end