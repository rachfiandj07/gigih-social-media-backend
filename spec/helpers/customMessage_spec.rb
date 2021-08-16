require_relative '../../app/helpers/customErrorMessage'

describe CustomErrorMessage do
  it 'should raise custom message without status code' do
    customErrorMessage = CustomErrorMessage.new('failed to crud with external service')

    expect(customErrorMessage.message).to eq('failed to crud with external service')
  end

  it 'should raise custom message with status code' do
    customErrorMessage = CustomErrorMessage.new('failed to crud with external service', 401)

    expect(customErrorMessage.message).to eq('failed to crud with external service')
    expect(customErrorMessage.status).to eq(401)
  end
end
