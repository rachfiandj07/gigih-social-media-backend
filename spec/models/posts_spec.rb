require_relative '../../models/posts.rb'

describe Posts do
    before :each do
        @stub_client = double()
        @posts = Posts.new(post_id: 1, 
                           user_id: 1, 
                           description: 'Hello semangat #gigih #GiGih', 
                           attachment: nil, 
                           parent_id: 1, 
                           createdAt: '2021-08-15 00:51:03',
                           updatedAt: '2021-08-15 00:51:03'
                        )
        @response = {
            "post_id" => 1, 
            "user_id" => 1, 
            "description" => 'Hello semangat #gigih #GiGih', 
            "attachment" => nil, 
            "parent_id" => 1, 
            "createdAt" => '2021-08-15 00:51:03',
            "updatedAt" => '2021-08-15 00:51:03'
        }
        allow(Mysql2::Client).to receive(:new).and_return(@stub_client)
    end
    
    context 'post' do
        describe 'given valid params' do
            it 'should create post' do
                stub_query = "INSERT INTO posts (user_id, description, attachment, parent_id) VALUES (#{@posts.user_id},'#{@posts.description}','#{@posts.attachment}',#{@posts.parent_id})"
                stub_query_last_insert = "SET @id = LAST_INSERT_ID();"
                stub_query_response = "SELECT * FROM posts WHERE post_id = @id"
                
                allow(@stub_client).to receive(:last_id).and_return(1)
                expect(@stub_client).to receive(:query).with(stub_query)
                expect(@stub_client).to receive(:query).with(stub_query_last_insert)
                expect(@stub_client).to receive(:query).with(stub_query_response).and_return([@response])

                mock_hashtag = double()
                allow(Hashtags).to receive(:new).and_return(mock_hashtag)
                allow(mock_hashtag).to receive(:post)
                allow(mock_hashtag).to receive(:post_hashtag)

                @posts.post
            end
        end 
    end

    context 'comment' do
        describe 'given valid params' do
            it 'should create comment' do
                stub_query = "INSERT INTO posts (user_id, description, attachment, parent_id) VALUES (#{@posts.user_id},'#{@posts.description}','#{@posts.attachment}',#{@posts.parent_id})"
                stub_query_response = "SELECT * FROM posts WHERE parent_id = #{@posts.parent_id}"
                expect(@stub_client).to receive(:query).with(stub_query)
                expect(@stub_client).to receive(:query).with(stub_query_response)

                mock_hashtag = double()
                allow(Hashtags).to receive(:new).and_return(mock_hashtag)
                allow(mock_hashtag).to receive(:post)

                expect(stub_query).to eq(@response)

                @posts.comment
            end
        end
    end

    context 'check hashtag' do
        it 'should return list of hashtags' do
            hashtag_list = ['gigih', 'gigih']

            expect(@posts.check_hashtag).to eq(hashtag_list)
        end
    end
end