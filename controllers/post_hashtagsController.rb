require_relative '../models/post_hashtags'

class PostHashtagsController
  def search_post_hashtag(params)
    array = []
    post_hashtag = PostHashtags.new(params)
    post_hashtag.get_post_contain_hashtag
    post_hashtag.get_post_contain_hashtag.each do |res|
      array.push(res)
    end
    if array.empty?
      {
        'message' => 'Success',
        'status' => 200,
        'method' => 'POST',
        'data' => 'Hashtag is not available'
      }
    else
      {
        'message' => 'Success',
        'status' => 200,
        'method' => 'POST',
        'data' => array
      }
    end
  end

  def get_list_trending
    array = []
    post_hashtag = PostHashtags.get_list_trending_hashtag
    {
      'message' => 'Success',
      'status' => 200,
      'method' => 'POST',
      'data' => post_hashtag.each
    }
  end
end
