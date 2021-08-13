require_relative '../../app/helpers/invalidPostMessage.rb'

describe InvalidPostMessage do
    it 'raise unexpected error message' do
        invalidPost = InvalidPostMessage.new

        expect(invalidPost).to eq(invalidPost)
    end
end
