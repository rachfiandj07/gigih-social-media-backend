require_relative '../../controllers/postController.rb'

describe PostController do
    before :each do
        @stub_client = double()
        @controller = PostController.new
    end

    describe 'create post' do
        context 'given valid params' do
            it 'should return response status 201' do
                response = {
                    'message' => 'Success',
                    'status' => 201,
                    'method' => 'POST',
                    'data' => [{
                      'post_id' => 1,
                      'user_id' => 1,
                      'description' => 'Semangat #gigih',
                      'createdAt' => '2021-08-15 00:51:03',
                      'updatedAt' => '2021-08-15 00:51:03',
                      'attachment' => 'image.jpeg',
                      'parent_id' => nil
                    }]
                }

                params = {
                    'post_id' => 1,
                    'user_id' => 1,
                    'description' => 'Semangat #gigih',
                    'createdAt' => '2021-08-15 00:51:03',
                    'updatedAt' => '2021-08-15 00:51:03',
                    'attachment' => 'image.jpeg',
                    'parent_id' => nil
                }

                allow(Users).to receive(:new).with(params).and_return(@stub_client)
                allow(@stub_client).to receive(:get_new_insert).and_return(response['data'])
                allow(@stub_client).to receive(:post).and_return(200)

                result = @controller.create_post(params)
                expect(result).to eq(response)
            end 
        end
    end
end