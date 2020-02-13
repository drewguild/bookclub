module Books
    class SynchronizeBook
        def initialize(book)
            @book = book
        end

        def call
            adapter = LibraryAdapter.new
            book_data = adapter.search(@book.title, @book.author)
            @book.update_attributes!(description: book_data.description)
        end
    end
end