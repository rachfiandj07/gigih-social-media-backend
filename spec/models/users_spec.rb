# frozen_string_literal: true

require_relative '../../models/users'

describe Users do
  before :each do
    @stub_client = double()
    @users = Users.new(user_id: 1, username: '@naufalrdj', bio: 'Hello', email: 'test@gmail.com',
                       createdAt: '2021-08-15 00:51:03', updatedAt: '2021-08-15 00:51:03')
    @response = {
      'user_id' => 1,
      'username' => 'naufalrdj',
      'bio' => 'Hello',
      'email' => 'test@gmail.com',
      'createdAt' => '2021-08-15 00:51:03',
      'updatedAt' => '2021-08-15 00:51:03'
    }
    allow(Mysql2::Client).to receive(:new).and_return(@stub_client)
  end

  describe 'get new user' do
    it 'should return a new data user' do
      stub_query = "SELECT * FROM users ORDER BY user_id DESC LIMIT 0, 1"

      expect(@stub_client).to receive(:query).with(stub_query).and_return([@response])

      @users.get_new_user
    end
  end

  describe 'register' do
    context 'given valid params' do
      it 'should save user data' do
        stub_query = "INSERT INTO users (username, bio, email) VALUES ('#{@users.username}','#{@users.bio}','#{@users.email}')"
        stub_query_last_insert = 'SET @id = LAST_INSERT_ID();'
        stub_query_response = 'SELECT * FROM users WHERE user_id = @id'

        expect(@stub_client).to receive(:query).with(stub_query)
        expect(@stub_client).to receive(:query).with(stub_query_last_insert)
        expect(@stub_client).to receive(:query).with(stub_query_response).and_return([@response])

        @users.register
      end
    end
    context 'given invalid params' do
      it 'should not save user data' do
        users = Users.new(user_id: nil, username: nil, bio: nil, email: 'foo#mail.com', createdAt: nil, updatedAt: nil)
        
        expect(users.register).to eq(false)
      end
    end
  end

  describe 'initialize' do
    it 'should return not nil' do
      expect(@users).not_to be_nil
    end
  end

  describe 'valid?' do
    context 'given valid params' do
      it 'should return true' do
        expect(@users.valid?).to eq(true)
      end
    end

    context 'given invalid params' do
      it 'should return false when username is nil' do
        users = Users.new(user_id: 1, username: nil, bio: 'Hello', email: 'test@gmail.com',
                          createdAt: '2021-08-15 00:51:03', updatedAt: '2021-08-15 00:51:03')

        expect(users.valid?).to eq(false)
      end
      it 'should return false when bio is nil' do
        users = Users.new(user_id: 1, username: '@naufalrdj', bio: nil, email: 'test@gmail.com',
                          createdAt: '2021-08-15 00:51:03', updatedAt: '2021-08-15 00:51:03')

        expect(users.valid?).to eq(false)
      end
      it 'should return false when email is not equal /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i' do
        users = Users.new(user_id: 1, username: '@naufalrdj', bio: 'Hello', email: 'foo#mail.com',
                          createdAt: '2021-08-15 00:51:03', updatedAt: '2021-08-15 00:51:03')

        expect(users.valid?).to eq(false)
      end
    end
  end
end
