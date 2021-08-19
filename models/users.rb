# frozen_string_literal: true

require_relative '../config/connection'

class Users
  attr_reader :username, :bio, :email

  def initialize(params)
    @username = params[:username]
    @bio = params[:bio]
    @email = params[:email]
  end

  def register
    return false unless valid?

    client = create_db_client
    insert = client.query("INSERT INTO users (username, bio, email) VALUES ('#{@username}','#{@bio}','#{@email}')")
    last_insert_id = client.query('SET @id = LAST_INSERT_ID();')
    response = client.query('SELECT * FROM users WHERE user_id = @id')

    data = response

    return 200 if valid?
  end

  def get_new_user
    client = create_db_client
    get_new_user = client.query('SELECT * FROM users ORDER BY user_id DESC LIMIT 0, 1')

    data = get_new_user
  end

  def valid?
    return false if @username.nil? ||
                    @bio.nil? ||
                    !@email.match(/\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i)

    true
  end
end
