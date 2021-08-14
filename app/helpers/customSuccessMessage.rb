class CustomSuccessMessage
    attr_accessor :message, :status

    def initialize(message='Success', status=200)
        @message = message
        @status = status
    end
end