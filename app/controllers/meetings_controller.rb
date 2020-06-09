class MeetingsController < ApplicationController
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
end