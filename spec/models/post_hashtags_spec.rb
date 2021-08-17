require_relative '../../models/post_hashtags'

describe PostHashtags do
  before :each do
    @stub_client = double
    @post_hashtags = PostHashtags.new(name: 'JAKARTA')
    @response = {
      'post_id' => 1,
      'username' => 'naufalrdj',
      'description' => 'Hello #gigih from #jakarta',
      'attachment' => nil,
      'parent_id' => nil,
      'createdAt' => '2021-08-15 00:51:03',
      'updatedAt' => '2021-08-15 00:51:03',
      'name' => 'jakarta'
    }
    allow(Mysql2::Client).to receive(:new).and_return(@stub_client)
  end

  describe 'get post contain hashtag' do
    it 'should return response by hashtag name' do
      stub_query = "SELECT user_posts.post_id, users.username, user_posts.description, user_posts.attachment, user_posts.parent_id ,user_posts.createdAt, user_posts.updatedAt, hashtags.`name`
            FROM user_posts
            LEFT JOIN post_hashtags ON user_posts.post_id = post_hashtags.post_id
            LEFT JOIN hashtags ON hashtags.hashtag_id = post_hashtags.hashtag_id
            LEFT JOIN users ON users.user_id = user_posts.user_id
            WHERE hashtags.`name` LIKE %#{@post_hashtags.name}%"

      expect(@stub_client).to receive(:query).and_return([@response])

      @post_hashtags.get_post_contain_hashtag
    end
  end
end
