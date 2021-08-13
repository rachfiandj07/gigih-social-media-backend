class InvalidPostMessage < StandardError
    @@msg = "An unexpected error occurred"
    @@status = 401

    def self.msg
        @@msg
    end

    def self.status
        @@status 
    end
end