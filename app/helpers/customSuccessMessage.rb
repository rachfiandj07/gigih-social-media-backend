class CustomSuccessMessage
  attr_accessor :message, :status, :method

  def initialize(message = 'Success', status = 200, method)
    @message = message
    @status = status
    @method = method
  end
end
