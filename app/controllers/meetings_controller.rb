class MeetingsController < ApplicationController
  def edit
    @meeting = Meeting.find(params["id"])
  end

  def new

  end

  def update
    Meetings::UpdateMeeting.new(params).call

    redirect_to overview_path
  end
end