require_relative '../../models/users.rb'

describe Users do
    before :each do
        @stub_client = double()
        @users = Users.new('@naufalrdj', 'Hello', 'test@gmail.com')
        @response = {
            "user_id" => 1,
            "username" => "naufalrdj",
            "bio" => "Hello",
            "email" => "test@gmail.com",
            "createdAt" => "2021-08-15 00:51:03",
            "updatedAt" => "2021-08-15 00:51:03"
        }
        allow(Mysql2::Client).to receive(:new).and_return(@stub_client)
    end

    describe 'register' do
        context 'given valid params' do
            it 'should save user data' do
                stub_query = "INSERT INTO users (username, bio, email) VALUES ('#{@users.username}','#{@users.bio}','#{@users.email}')"
                stub_query_response = "SELECT * FROM users WHERE LAST_INSERT_ID()"

                expect(@stub_client).to receive(:query).with(stub_query)
                expect(@stub_client).to receive(:query).with(stub_query_response).and_return([@response])

                @users.register
            end
        end
        context 'given invalid params' do
            it 'should not save user data' do
                users = Users.new(nil, nil, nil)

                expect(users.register).to eq(false)
            end
        end
    end

    describe 'initialize' do
        it 'should return not nil' do
            users = Users.new('@naufalrdj', 'Hello', 'test@gmail.com')

            expect(users).not_to be_nil
        end
    end

    describe 'valid?' do

        context 'given valid params' do
            it 'should return true' do
                users = Users.new('@naufalrdj', 'Hello', 'test@gmail.com')
    
                expect(users.valid?).to eq(true)
            end
        end

        context 'given invalid params' do
            it 'should return false when username is nil' do
                users = Users.new(nil, 'Hello', 'test@gmail.com')

                expect(users.valid?).to eq(false)
            end
            it 'should return false when bio is nil' do
                users = Users.new('@naufalrdj', nil, 'test@gmail.com')

                expect(users.valid?).to eq(false)
            end
            it 'should return false when email is nil' do
                users = Users.new('@naufalrdj', 'Hello', nil)

                expect(users.valid?).to eq(false)
            end
        end

    end

end
