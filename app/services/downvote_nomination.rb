class DownvoteNomination
    def initialize(nomination_id, member)
        @id = nomination_id
        @member = member
    end

    def call
        nomination = Nomination.find(@id)

        Vote.find_by!(nomination_id: @id, member_id: @member.id).destroy!

        nomination.reload
    end
end