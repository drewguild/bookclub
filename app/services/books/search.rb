class Books::Search
  attr_reader :author, :title
  def initialize(options = {})
    @author = options[:author]
    @title = options[:title]    
  end

  def call
    LibraryAdapter.new.search_all(title, author)
  end
end