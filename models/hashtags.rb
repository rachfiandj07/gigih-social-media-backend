require_relative '../config/connection.rb'

class Hashtags
    attr_accessor :name, :hashtag_id

    def initialize(params)
        @hashtag_id = params[:hashtag_id]
        @name = params[:name],
        @createdAt = params[:createdAt],
        @updatedAt = params[:updatedAt]
    end
    
    def post_hashtag(post_id)
        client = create_db_client

        insert = client.query("INSERT INTO post_hashtags (hashtag_id,post_id) VALUES (#{@hashtag_id},#{post_id})")
    end
end