class ClubOverview
    attr_reader :club

    def initialize(club)
        @club = club
    end

    def books
        club.members.flat_map(&:nominations).map do |nomination|
            NominatedBook.new(nomination, nomination.book)
        end
    end

    def next_meeting_date
        (club.next_meeting || NullMeeting.new).held_on
    end

    def total_members
        club.members.count
    end

    def voted_members
        #TODO: this is a blunt method of counting. Needs refining
        # once nominations are tied to specific meetings
        club.members.select { |member| Vote.find_by(member: member) }
    end

    def voted_members_count
        voted_members.count
    end
end