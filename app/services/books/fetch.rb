class Books::Fetch 
  attr_reader :author, :title
  def initialize(options)
    @author = options[:author]
    @title = options[:title]
  end

  def call
    # TODO: this isn't really resiliant against slight variations in format
    # e.g "ee cummings" vs "e.e. cummings" would be a miss
    if book = Book.find_by(author: author, title: title)
      return book
    end

    book = Book.create!(author: author, title: title)
    Books::SynchronizeBook.new(book).call
    book
  end
end