require 'net/http'
require 'json'

class String
  def queryize
    downcase.gsub(" ", "+")
  end
end

class LibraryAdapter
  BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="

  def search(title, author)
    url = BASE_URL + "#{(title + ' ' + author).queryize}"
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

    def thumbnail
      @data.dig("imageLinks", "smallThumbnail")
    end
  end
end