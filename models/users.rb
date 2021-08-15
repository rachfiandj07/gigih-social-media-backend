require_relative '../config/connection.rb'

class Users
    attr_accessor :username, :bio, :email
    attr_reader :user_id, :createdAt, :updatedAt

    def initialize(params)
        @user_id = params[:user_id]
        @username = params[:username]
        @bio = params[:bio]
        @email = params[:email]
        @createdAt = params[:createdAt]
        @updatedAt = params[:updatedAt]
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