require_relative '../../app/helpers/customErrorMessage.rb'

describe CustomErrorMessage do
    it 'raise custom message' do
        customErrorMessage = CustomErrorMessage.new('failed to crud with external service')

        expect(customErrorMessage.message).to eq("failed to crud with external service")
    end
end