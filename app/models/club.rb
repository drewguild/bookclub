class Club < ApplicationRecord
    has_many :meetings
    has_many :members
    has_many :collections, as: :owner
    
    def create_member!(member_name)
      first, last = member_name.split(" ")
      members.create!(
          first_name: first,
          last_name: last
      )
    end

    def upcoming_meetings
      meetings.upcoming
    end

    def next_meeting
      meetings.upcoming.first || NullMeeting.new
    end
end
