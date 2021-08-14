class CustomErrorMessage < StandardError
    attr_accessor :message, :status
  
    def initialize(message, status=nil)
      @message = message
      @status = status
    end
end