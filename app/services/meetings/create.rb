module Meetings
  class Create
    attr_reader :book_id, :club_id, :held_on
    def initialize(options)
      @book_id = options[:book_id]
      @club_id = options[:club_id]
      @held_on = options[:held_on]
    end

    def call 
      Meeting.create!(
        book_id: book_id,
        club_id: club_id,
        held_on: held_on
      )
    end
  end
end