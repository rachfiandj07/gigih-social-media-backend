require_relative '../../controllers/usersController.rb'

describe UsersController do
    before :each do
        @stub_client = double()
        @controller = UsersController.new()
    end
    
    describe 'register user' do
        context 'given valid params' do
            it 'should return response status 200' do
                allow(Users).to receive(:new).and_return(@stub_client)
                expect(@stub_client).to receive(:register)

                response = {
                    "message" => "Success",
                    "status" => 200,
                    "method" => "POST",
                    "data" => {
                        "user_id" => 1,
                        "username" => "naufalrdj",
                        "bio" => "Hello",
                        "email" => "test@gmail.com",
                        "createdAt" => "2021-08-15 00:51:03",
                        "updatedAt" => "2021-08-15 00:51:03"
                    }
                }

                params = {
                    "user_id" => 1,
                    "username" => "naufalrdj",
                    "bio" => "Hello",
                    "email" => "test@gmail.com",
                    "createdAt" => "2021-08-15 00:51:03",
                    "updatedAt" => "2021-08-15 00:51:03"
                }

                result = @controller.register(params)
                expect(result).to eq(response)
            end
        end
        
        context 'when given invalid params' do
            it 'should return response status 401' do
                allow(Users).to receive(:new).and_return(@stub_client)
                expect(@stub_client).to receive(:register)

                response = {
                    "message" => "Failed",
                    "status" => 401,
                    "data" => []
                }

                result = @controller.register([])
                expect(result).to eq(response)
            end
        end
    end
end