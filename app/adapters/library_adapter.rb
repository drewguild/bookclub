#TODO: this adapter will be decomposed once interactions with the API take on more shape
# should separate OpenLibraryAPI specifics from generic interaction stuff
class String
    def queryize
        downcase.gsub(" ", "+")
    end
end

class LibraryAdapter
    def search(title, author)
        url = "http://openlibrary.org/search.json?title=#{title.queryize}&author=#{author.queryize}"
        uri = URI(url)
        response = Net::HTTP.get(uri)

        #WARNING: this first is a simplification. Many results possibly excluded
        data = JSON.parse(response)["docs"].first
        DeserializedSearchResult.new(data)
    end

    def get_book(isbn)
        bibkey = "ISBN:#{isbn}"
        url = "https://openlibrary.org/api/books?bibkeys=#{bibkey}&format=json&jscmd=details"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        data = JSON.parse(response)["ISBN:#{isbn}"]
        DeserializedBook.new(data)
    end

    class DeserializedBook
        def initialize(json)
            @data = json
        end

        def description
            @data.dig("details", "description")
        end
    end

    class DeserializedSearchResult
        def initialize(json)
            @data = json
        end

        def isbns
            @data["isbn"]
        end
    end
end