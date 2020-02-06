class UpvoteNomination
    def initialize(nomination_id, member)
        @id = nomination_id
        @member = member
    end

    def call
        nomination = Nomination.find(@id)

        Vote.create!(nomination_id: @id, member_id: @member.id)

        nomination.reload
    end
end