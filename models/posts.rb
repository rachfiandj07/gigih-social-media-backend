# frozen_string_literal: true

require_relative '../config/connection'
require_relative '../models/hashtags'

class Posts
  attr_accessor :user_id, :description, :attachment, :parent_id
  attr_reader :post_id, :createdAt, :updatedAt

  def initialize(params)
    @post_id = params[:post_id]
    @user_id = params[:user_id]
    @description = params[:description]
    @attachment = params[:attachment]
    @parent_id = params[:parent_id]
    @createdAt = params[:createdAt]
    @updatedAt = params[:updatedAt]
  end

  def valid?
    return false if @user_id.nil?
    return false if @description.nil? || @description.length > 1000

    true
  end

  def get_new_insert
    client = create_db_client
    get_new_insert = client.query('SELECT * FROM user_posts ORDER BY post_id DESC LIMIT 0, 1')

    data = get_new_insert
  end

  def comment
    return false unless valid?

    client = create_db_client
    insert = client.query("INSERT INTO posts (user_id, description, attachment, parent_id) VALUES (#{@user_id},'#{@description}','#{@attachment}',#{@parent_id})")

    hashtags = check_hashtag
    hashtags.each do |data|
      hashtag = Hashtags.new(name: data)
      hashtag.post
      hashtag.post_hashtag(client.last_id)
    end

    return 201 if valid?
  end

  def post
    return false unless valid?

    client = create_db_client
    insert = client.query("INSERT INTO posts (user_id, description, attachment, parent_id) VALUES (#{@user_id},'#{@description}','#{@attachment}',#{@parent_id})")

    hashtags = check_hashtag
    hashtags.each do |data|
      hashtag = Hashtags.new(name: data)
      hashtag.post
      hashtag.post_hashtag(client.last_id)
    end

    return 200 if valid?
  end

  def check_hashtag
    @description.downcase.scan(/#(\w+)/).flatten.uniq
  end
end
