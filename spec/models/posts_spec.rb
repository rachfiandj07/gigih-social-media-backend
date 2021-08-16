require_relative '../../models/posts.rb'

describe Posts do
    before :each do
        @stub_client = double()
        @posts = Users.new(post_id: 1, 
                           user_id: 1, 
                           description: 'Hello semangat #gigih #gigih', 
                           attachment: nil, 
                           parent_id: nil, 
                           createdAt: '2021-08-15 00:51:03',
                           updatedAt: '2021-08-15 00:51:03'
                        )
        @response = {
            "post_id" => 1, 
            "user_id" => 1, 
            "description" => 'Hello semangat #gigih #gigih', 
            "attachment" => nil, 
            "parent_id" => nil, 
            "createdAt" => '2021-08-15 00:51:03',
            "updatedAt" => '2021-08-15 00:51:03'
        }
        allow(Mysql2::Client).to receive(:new).and_return(@stub_client)
    end
    
    context 'post' do
        describe 'given valid params' do
            it 'should create post' do
                stub_query = "INSERT INTO posts (user_id, description, attachment, parent_id) 
                              VALUES 
                              (#{@posts.user_id},'#{@posts.description}','#{@posts.attachment}',#{@posts.parent_id})"

                mock_hashtag = double()
                allow(Hashtag).to receive(:new).and_return(mock_hashtag)
                allow(mock_hashtag).to receive(:post)

                expect(stub_query).to eq(@response)
            end
        end 
    end
end