require 'net/http'
require 'json'

class String
  def queryize
    downcase.gsub(" ", "+")
  end
end

class LibraryAdapter
  BASE_URL = "https://www.googleapis.com/books/v1/volumes?q="

  attr_reader :http_service
  def initialize(options = {})
    @http_service = options[:http_service] || Net::HTTP
  end

  def search(title, author)
    url = BASE_URL + query_string(title: title, author: author)
    uri = URI(url)
    response = http_service.get(uri)

    #WARNING: this first is a simplification. Many results possibly excluded
    data = JSON.parse(response)["items"].first["volumeInfo"]
    DeserializedBook.new(data)
  end

  def search_all(title, author)
    url = BASE_URL + query_string(title: title, author: author)
    uri = URI(url)
    response = Net::HTTP.get(uri)

    items = JSON.parse(response)["items"]

    items.map do |item|
      DeserializedBook.new(item["volumeInfo"])
    end
  end

  private

  def query_string(terms)
    title = terms[:title]
    author = terms[:author]

    "intitle:#{title} inauthor:#{author}".queryize
  end

  class DeserializedBook
    def initialize(json)
      @data = json
    end
    
    def author
      @data.dig("author") || ( @data.dig("authors") || [])[0]
    end

    def description
      @data.dig("description")
    end

    def thumbnail
      @data.dig("imageLinks", "smallThumbnail")
    end

    def title
      @data.dig("title")
    end
  end
end