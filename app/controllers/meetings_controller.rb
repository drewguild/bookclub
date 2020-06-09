class MeetingsController < ApplicationController
  def create
    unless meeting_param[:book_id].present? && meeting_param[:held_on].present?
      redirect_to meetings_new_path, { flash: { error: "Please include all fields" } } and return
    end

    Meetings::Create.new(meeting_param.merge(club_id: current_club.id)).call
    redirect_to overview_path
  end

  def edit
    @meeting = Meeting.find(params["id"])
  end

  def new
    @meeting_options = {
      books: book_options
    }
  end

  def update
    Meetings::UpdateMeeting.new(params).call

    redirect_to overview_path
  end

  private

  def book_options
    NominationsQuery.new.all.map do |book|
      [book.title, book.id]
    end
  end

  def meeting_param
    params[:meeting]
  end
end