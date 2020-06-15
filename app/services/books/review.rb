module Books
  class Review
    attr_reader :book_id, :member_id, :text
    def initialize(options)
      @book_id = options[:book_id]
      @member_id = options[:member_id]
      @text = options[:text]
    end

    def call
      ::Review.create!(
        book_id: book_id,
        member_id: member_id,
        text: text
      )
    end
  end
end