class UpvoteNomination
    def initialize(nomination_id)
        @id = nomination_id
    end

    def call
        nomination = Nomination.find(@id)
        nomination.increment!(:upvotes)
        nomination.reload
    end
end