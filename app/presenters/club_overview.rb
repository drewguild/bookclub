class ClubOverview
    attr_reader :club, :member

    def initialize(club, member)
        @club = club
        @member = member
    end

    def books
      members.flat_map(&:nominations).map do |nomination|
        NominatedBook.new(nomination, nomination.book)
      end
    end

    def club_name
      club.name
    end

    def meetings
      club.upcoming_meetings
    end

    def members
      club.members
    end

    def member_can_nominate?
      !member.nominations.any?
    end

    def next_meeting
      club.next_meeting
    end

    def next_meeting_date
        club.next_meeting.held_on
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
