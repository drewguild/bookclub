class ClubsController < ApplicationController
    def overview
        club = Club.find(current_user.member.club_id)

        @overview = ClubOverview.new(club, current_member)
    end
end
