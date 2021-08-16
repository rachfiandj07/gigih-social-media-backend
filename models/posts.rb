require_relative '../config/connection.rb'
require_relative '../models/hashtags.rb'

class Posts
    attr_accessor :user_id, :description, :attachment
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
        
    end

    def check_hashtag
        @description.downcase.scan(/#(\w+)/).flatten
    end
end