# frozen_string_literal: true

require_relative '../../models/hashtags'

describe Hashtags do
  before :each do
    @stub_client = double
    @hashtags = Hashtags.new(hashtag_id: 1, name: 'gigih', createdAt: '2021-08-15 00:51:03',
                             updatedAt: '2021-08-15 00:51:03')
    @response = {
      'hashtag_id' => 1,
      'name' => 'gigih',
      'createdAt' => '2021-08-15 00:51:03',
      'updatedAt' => '2021-08-15 00:51:03'
    }
    allow(Mysql2::Client).to receive(:new).and_return(@stub_client)
  end

  context 'valid' do
    context 'given valid params' do
      it 'should return true' do
        expect(@hashtags.valid?).to eq(true)
      end
    end
  end

  context 'get hashtag id' do
    it 'should return hashtag id search by name' do
      stub_query = "SELECT hashtag_id FROM hashtags WHERE hashtags.`name` LIKE '%#{@hashtags.name}%'"
      expect(@stub_client).to receive(:query).with(stub_query).and_return(@response['hashtag_id'])

      @hashtags.get_hashtag_id
    end
  end

  context 'post' do
    describe 'given valid params' do
      it 'should create hashtag' do
        stub_query = "INSERT INTO hashtags (name) VALUES ('#{@hashtags.name[0]}')"
        stub_query_last_insert = 'SET @id = LAST_INSERT_ID();'
        stub_query_response = 'SELECT hashtag_id FROM hashtags WHERE hashtag_id = @id'
        expect(@stub_client).to receive(:query).with(stub_query)
        expect(@stub_client).to receive(:query).with(stub_query_last_insert)
        expect(@stub_client).to receive(:query).with(stub_query_response).and_return([{}])

        @hashtags.post
      end
    end
  end

  context 'post hashtag' do
    describe 'given valid params' do
      it 'should create post hastag' do
        stub_query_post = "INSERT INTO hashtags (name) VALUES ('#{@hashtags.name[0]}')"
        stub_query_last_insert_post = 'SET @id = LAST_INSERT_ID();'
        stub_query_response_post = 'SELECT hashtag_id FROM hashtags WHERE hashtag_id = @id'
        stub_query_post_hashtag = "INSERT INTO post_hashtags (hashtag_id,post_id) VALUES (#{@hashtags.hashtag_id},1)"

        response = [{
          'hashtag_id' => 1
        }]

        expect(@stub_client).to receive(:query).with(stub_query_post)
        expect(@stub_client).to receive(:query).with(stub_query_last_insert_post)
        expect(@stub_client).to receive(:query).with(stub_query_response_post).and_return(response)
        expect(@stub_client).to receive(:query).with(stub_query_post_hashtag)

        @hashtags.post_hashtag(1)
      end
    end
  end
end
