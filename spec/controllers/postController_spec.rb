require_relative '../../controllers/postController'

describe PostController do
  before :each do
    @stub_client = double
    @controller = PostController.new
  end

  describe 'create post' do
    context 'given valid params' do
      it 'should return response status 201' do
        attachment = double

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
          'attachment' => attachment,
          'parent_id' => nil
        }

        allow(Posts).to receive(:new).with(params).and_return(@stub_client)
        allow(@stub_client).to receive(:get_new_insert).and_return(response['data'])
        allow(@stub_client).to receive(:post).and_return(201)

        allow(attachment).to receive('[]').with('filename').and_return('image.jpg')
        allow(attachment).to receive(:key?).with('filename').and_return(true)

        file = double
        expect(file).to receive(:write)
        allow(file).to receive(:read)
        allow(attachment).to receive('[]').with('tempfile').and_return(file)

        allow(File).to receive(:open) { |&block| block.call(file) }
        allow(@post).to receive(:to_hash).and_return({})

        result = @controller.create_post(params)
      end
    end
    context 'given invalid params' do
      it 'should return response status 401' do
        response = {
          'message' => 'Failed',
          'status' => 401,
          'method' => 'POST'
        }

        params = {
          'user_id' => 1,
          'description' => nil
        }

        allow(Posts).to receive(:new).with(params).and_return(@stub_client)
        allow(@stub_client).to receive(:get_new_insert).and_return([])
        allow(@stub_client).to receive(:post).and_return(false)

        result = @controller.create_post(params)
        expect(result).to eq(response)
      end
      it 'should not save the file when there is no attachment' do
        attachment = double
        allow(attachment).to receive('[]').with('filename').and_return('image.jpg')
        allow(attachment).to receive(:key?).with('filename').and_return(false)

        file = double
        allow(file).to receive(:read)
        allow(attachment).to receive('[]').with('tempfile').and_return(file)

        allow(File).to receive(:open) { |&block| block.call(file) }
        allow(@post).to receive(:to_hash).and_return({})
        params = {
          'post_id' => 1,
          'user_id' => 1,
          'description' => 'Semangat #gigih',
          'createdAt' => '2021-08-15 00:51:03',
          'updatedAt' => '2021-08-15 00:51:03',
          'attachment' => attachment,
          'parent_id' => nil
        }

        response = {
          'message' => 'Failed',
          'status' => 401,
          'method' => 'POST'
        }

        result = @controller.create_post(params)
        expect(result).to eq(response)
      end
    end
  end
end
