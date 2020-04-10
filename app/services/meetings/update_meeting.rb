module Meetings
  class UpdateMeeting
    def initialize(options)
      @meeting = Meeting.find(options["id"])
      @held_on = options["meeting"]["held_on"]
    end

    def call
      meeting.update_attributes!(held_on: held_on)
    end

    private
    attr_reader :held_on, :meeting
  end
end