# frozen_string_literal: true

require_relative '../config/connection'

class Hashtags
  attr_accessor :name, :hashtag_id

  def initialize(params)
    @hashtag_id = params[:hashtag_id]
    @name = params[:name],
    @createdAt = params[:createdAt],
    @updatedAt = params[:updatedAt]
  end

  def valid?
      return false if @name.nil?

      true
  end

  def post
    return false unless valid?

    client = create_db_client
    insert = client.query("INSERT INTO hashtags (name) VALUES ('#{@name}')")
    last_insert_id = client.query('SET @id = LAST_INSERT_ID();')
    response = client.query('SELECT * FROM hashtags WHERE hashtag_id = @id')

    data = response
  end

  def post_hashtag(post_id)
    client = create_db_client

    insert = client.query("INSERT INTO post_hashtags (hashtag_id,post_id) VALUES (#{@hashtag_id},#{post_id})")
  end
end
