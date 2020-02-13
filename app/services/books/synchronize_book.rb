module Books
    class SynchronizeBook
        def initialize(book)
            @book = book
        end

        def call
            adapter = LibraryAdapter.new
            isbn = adapter.search(@book.title, @book.author).isbns.find do |i| 
                i.starts_with?("0") || i.starts_with?("1")
            end
            book_data = adapter.get_book(isbn)
            @book.update_attributes!(description: book_data.description)
        end
    end
end