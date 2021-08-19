require_relative '../../controllers/post_hashtagsController'

describe PostHashtagsController do
  before :each do
    @stub_client = double
    @controller = PostHashtagsController.new
  end

  describe 'search post hashtag' do
    context 'with available hashtag' do
      it 'should return search response post contain hastag' do
        params = {
          'name' => 'gigih'
        }

        response = {
          'message' => 'Success',
          'status' => 200,
          'method' => 'POST',
          'data' => [{
            'post_id' => 1,
            'username' => 'naufalrdj',
            'description' => 'Hello #gigih',
            'attachment' => nil,
            'parent_id' => nil,
            'createdAt' => '2021-08-15 00:51:03',
            'updatedAt' => '2021-08-15 00:51:03'
          }]
        }

        allow(@stub_client).to receive(:get_post_contain_hashtag).and_return(response['data'])
        allow(PostHashtags).to receive(:new).and_return(@stub_client)

        result = @controller.search_post_hashtag(params)
        expect(result).to eq(response)
      end
    end
    context 'with unavailable hashtag' do
        it 'should return 404 and hashtag not found' do
            params = {
                'name' => 'GrabVsGojek'
            }
      
            response = {
                'message' => 'Success',
                'status' => 200,
                'method' => 'POST',
                'data' => 'Hashtag is not available'
            }
      
            allow(@stub_client).to receive(:get_post_contain_hashtag).and_return([])
            allow(PostHashtags).to receive(:new).and_return(@stub_client)
      
            result = @controller.search_post_hashtag(params)
            expect(result).to eq(response)
        end
    end
  end
  describe 'get list trending hashtag' do
    context 'top 5 trending past 24 hours' do
      it 'should return top 5 hashtag' do
        response = {
          'message' => 'Success',
          'status' => 200,
          'method' => 'POST',
          'data' => [{
            "count"=>0, 
            "hashtag_id"=>nil, 
            "name"=>nil
            }]
        }

        allow(@stub_client).to receive(:get_list_trending_hashtag).and_return(response['data'])
        allow(PostHashtags).to receive(:new).and_return(@stub_client)

        result = @controller.get_list_trending
        expect(result).to eq(response)
      end
    end
  end
end
