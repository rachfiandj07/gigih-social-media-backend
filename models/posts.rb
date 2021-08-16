require_relative '../config/connection.rb'
require_relative '../models/hashtags.rb'

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

    def post
        client = create_db_client
        insert = client.query("INSERT INTO posts (user_id, description, attachment, parent_id) VALUES (#{@user_id},'#{@description}','#{@attachment}',#{@parent_id})")
        last_insert_id = client.query("SET @id = LAST_INSERT_ID();")
        response = client.query("SELECT * FROM posts WHERE post_id = @id")

        hashtags = self.check_hashtag
        hashtags.each do |data|
            hashtag = Hashtags.new(name: data)
            hashtag.post
            hashtag.post_hashtag(client.last_id)
        end

        data = response
    end

    def check_hashtag
        @description.downcase.scan(/#(\w+)/).flatten
    end
end