#TODO: this adapter will be decomposed once interactions with the API take on more shape
# should separate OpenLibraryAPI specifics from generic interaction stuff
class String
    def queryize
        downcase.gsub(" ", "+")
    end
end

class LibraryAdapter
    def search(title, author)
        url = "https://www.googleapis.com/books/v1/volumes?q=#{(title + ' ' + author).queryize}"
        uri = URI(url)
        response = Net::HTTP.get(uri)

        #WARNING: this first is a simplification. Many results possibly excluded
        data = JSON.parse(response)["items"].first["volumeInfo"]
        DeserializedBook.new(data)
    end

    class DeserializedBook
        def initialize(json)
            @data = json
        end

        def description
            @data.dig("description")
        end
    end
end