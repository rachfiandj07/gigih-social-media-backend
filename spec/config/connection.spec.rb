require_relative '../../config/connection.rb'

describe create_db_client do
    it 'it should mock mysql connection' do
        stub_client = double()

        allow(Mysql2::Client).to receive(:new).and_return(stub_client)
        expect(stub_client).not_to be_nil
    end
end