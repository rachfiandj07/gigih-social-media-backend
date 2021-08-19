require_relative '../models/posts.rb'

class PostController
    def create_post(params)
        array = Array.new
        posts = Posts.new(params)
        posts.get_new_insert do |res|
            array.push(res)
        end
        if posts.post == 201
            return {
                'message' => 'Success',
                'status' => 201,
                'method' => 'POST',
                'data' => array
            }
        else
            return {
                'message' => 'Failed',
                'status' => 401,
                'method' => 'POST',
            }
        end

    end
end