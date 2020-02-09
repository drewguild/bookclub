class RevokeNomination
    def initialize(nomination)
        @nomination = nomination
    end

    def call 
        @nomination.destroy!

        @nomination.id
    end
end