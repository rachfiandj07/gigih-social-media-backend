require_relative '../config/connection.rb'

class Users
    attr_accessor :username, :bio, :email

    def initialize(username, bio, email)
        @username = username
        @bio = bio
        @email = email
    end

    def register
        return false unless self.valid?

        client = create_db_client
        insert = client.query("INSERT INTO users (username, bio, email) VALUES ('#{@username}','#{@bio}','#{@email}')")
        response = client.query("SELECT * FROM users WHERE LAST_INSERT_ID()")

        data = response
    end

    def valid?
        return false if @username.nil? || @bio.nil? || @email.nil?

        true
    end
end