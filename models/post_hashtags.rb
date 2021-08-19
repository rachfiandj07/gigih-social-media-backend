# frozen_string_literal: true

require_relative '../config/connection'

class PostHashtags
  attr_reader :name

  def initialize(params)
    @name = params[:name]
  end

  def get_post_contain_hashtag
    client = create_db_client
    get_post_contain_hashtag = client.query("SELECT user_posts.post_id, users.username, user_posts.description, user_posts.attachment, user_posts.parent_id ,user_posts.createdAt, user_posts.updatedAt, hashtags.`name`
            FROM user_posts
            LEFT JOIN post_hashtags ON user_posts.post_id = post_hashtags.post_id
            LEFT JOIN hashtags ON hashtags.hashtag_id = post_hashtags.hashtag_id
            LEFT JOIN users ON users.user_id = user_posts.user_id
            WHERE hashtags.`name` LIKE '%#{@name}%'")

    data = get_post_contain_hashtag
  end

  def self.get_list_trending_hashtag
    client = create_db_client
    query = 
            "
            SELECT
                hashtags.hashtag_id,
                COUNT(hashtags.hashtag_id) AS count,
                hashtags. `name`
            FROM
                user_posts
                LEFT JOIN post_hashtags ON user_posts.post_id = post_hashtags.post_id
                LEFT JOIN hashtags ON hashtags.hashtag_id = post_hashtags.hashtag_id
                LEFT JOIN users ON users.user_id = user_posts.user_id
            WHERE
                user_posts.createdAt > DATE_SUB(NOW(), INTERVAL 24 HOUR)
            GROUP BY
                hashtags.`name`
            ORDER BY
                count DESC
            LIMIT 5
            "
    response = client.query(query)

    data = response
  end
end
