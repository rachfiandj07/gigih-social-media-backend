require_relative '../controllers/post_hashtagsController_spec.rb'

describe PostHashtagsController do
    before :each do
        @stub_client = double
        @controller = PostHashtagsController.new
    end

    describe 'search post hashtag' do
        context 'with available hashtag' do
            it 'should return search response post contain hastag' do
                allow(PostHashtags).to receive(:new).and_return(@stub_client)

                response = {
                    'message' => 'Success',
                    'status' => 200,
                    'method' => 'POST',
                    'data' => {
                      'post_id' => 1,
                      'username' => 'naufalrdj',
                      'description' => 'Hello #gigih',
                      'attachment' => nil,
                      'parent_id' => nil,
                      'createdAt' => '2021-08-15 00:51:03',
                      'updatedAt' => '2021-08-15 00:51:03'
                    }
                }

                params = {
                    "name" => "gigih"
                }

                result = @controller.search_post_hashtag(params)
                expect(result).to eq(response)
            end
        end
    end
end