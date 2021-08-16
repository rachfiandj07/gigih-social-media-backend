require_relative '../config/connection'

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
    return false unless valid?

    client = create_db_client
    insert = client.query("INSERT INTO users (username, bio, email) VALUES ('#{@username}','#{@bio}','#{@email}')")
    last_insert_id = client.query('SET @id = LAST_INSERT_ID();')
    response = client.query('SELECT * FROM users WHERE user_id = @id')

    data = response
  end

  def valid?
    return false if @username.nil? || @bio.nil? || @email.nil?

    true
  end
end
