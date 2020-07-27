require 'test_helper'
require "./app/adapters/library_adapter"

class LibraryAdapterTest < ActiveSupport::TestCase
  def build_stub_response(options = {})
    items = (options[:count] || 1).times.map do |i|
      {
        "volumeInfo" => {
          "description" => options[:description] || "",
          "imageLinks" => {
            "smallThumbnail" => options[:thumbnail] || ""
          }
        }
      }
    end

    {
      "items" => items
    }.to_json
  end

  test ".search queries the external api" do
    title = "Title"
    author = "Author Name"
    expected_uri = URI(LibraryAdapter::BASE_URL + "intitle:title+inauthor:author+name")

    mock = Minitest::Mock.new
    mock.expect(:get, build_stub_response, [expected_uri])

    LibraryAdapter.new(http_service: mock).search(title, author)
    assert_mock mock
  end

  test ".search returns a deserialized book" do
    stub_response = build_stub_response

    title = "The Great Novel"
    author = "Writey McWriterson"

    Net::HTTP.stub :get, stub_response do
     
      result = LibraryAdapter.new.search(title, author)
      assert_equal result.class, LibraryAdapter::DeserializedBook
    end
  end

  test ".search provides access to the book's description" do
    description = "A book"
    stub_response = build_stub_response(description: description)

    title = "The Great Novel"
    author = "Writey McWriterson"
    
    Net::HTTP.stub :get, stub_response do
      result = LibraryAdapter.new.search(title, author)

      assert_equal result.description, description      
    end
  end

  test ".search provides access to the book's thumbnail" do
    thumbnail = "image_url"
    stub_response = build_stub_response(thumbnail: thumbnail)

    title = "The Great Novel"
    author = "Writey McWriterson"

    Net::HTTP.stub :get, stub_response do
     
      result = LibraryAdapter.new.search(title, author)

      assert_equal result.thumbnail, thumbnail      
    end
  end

  test ".search_all returns a set of deserialized books" do 
    count = 3
    response_items = build_stub_response(count: count)

    adapter = LibraryAdapter.new
    title = "The Great Novel"
    author = "Writey McWriterson"

    Net::HTTP.stub :get, response_items do
      result = adapter.search_all(title, author)
      assert_equal result.size, count
      result.each do |r|
        assert_kind_of LibraryAdapter::DeserializedBook, r
      end
    end
  end
end