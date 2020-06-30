class Collections::AddBook
  attr_reader :book_options, :collection_type, :owner

  def initialize(options)
    @owner = options[:owner]
    @collection_type = options[:collection_type]
    @book_options = options.slice(:author, :title)
  end

  def call
    owner.collections.find_by_type(collection_type).books << Books::Fetch.new(book_options).call
  end
end