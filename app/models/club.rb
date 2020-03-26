class Club < ApplicationRecord
    has_many :meetings
    has_many :members
    
    def create_member!(member_name)
        first, last = member_name.split(" ")
        members.create!(
            first_name: first,
            last_name: last
        )
    end

    def next_meeting
        meetings.upcoming.first
    end
end
