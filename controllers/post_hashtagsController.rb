require_relative '../models/post_hashtags.rb'

class PostHashtagsController
    def search_post_hashtag(params)
        array = Array.new
        post_hashtag = PostHashtags.new(params)
        post_hashtag.get_post_contain_hashtag
        post_hashtag.get_post_contain_hashtag.each do |res|
            array.push(res)
        end
        return {
            'message' => 'Success',
            'status' => 200,
            'method' => 'POST',
            'data' => array
        }
    end

    def get_list_trending
        array = Array.new
        post_hashtag = PostHashtags.get_list_trending_hashtag
        post_hashtag.each do |res|
            array.push(res)
        end
        return {
            'message' => 'Success',
            'status' => 200,
            'method' => 'POST',
            'data' => array
        }
    end
end