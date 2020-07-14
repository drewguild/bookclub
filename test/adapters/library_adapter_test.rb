require "rspec"
require "./app/adapters/library_adapter"

describe "LibraryAdapter" do
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

  describe "search" do 

    it "queries the external api" do
      title = "Title"
      author = "Author Name"
      expected_uri = URI(LibraryAdapter::BASE_URL + "intitle:title+inauthor:author+name")

      expect(Net::HTTP)
        .to receive(:get)
        .with(expected_uri)
        .and_return(build_stub_response)

      LibraryAdapter.new.search(title, author)
    end

    it "returns a deserialized book" do
      stub_response = build_stub_response

      allow(Net::HTTP).to receive(:get).and_return(stub_response)

      title = "The Great Novel"
      author = "Writey McWriterson"
     
      result = LibraryAdapter.new.search(title, author)

      expect(result.class).to be(LibraryAdapter::DeserializedBook)
    end

    it "provides access to the book's description" do
      description = "A book"
      stub_response = build_stub_response(description: description)

      allow(Net::HTTP).to receive(:get).and_return(stub_response)

      title = "The Great Novel"
      author = "Writey McWriterson"
     
      result = LibraryAdapter.new.search(title, author)

      expect(result.description).to eq(description)      
    end

    it "provides access to the book's thumbnail" do
      thumbnail = "image_url"
      stub_response = build_stub_response(thumbnail: thumbnail)

      allow(Net::HTTP).to receive(:get).and_return(stub_response)

      title = "The Great Novel"
      author = "Writey McWriterson"
     
      result = LibraryAdapter.new.search(title, author)

      expect(result.thumbnail).to eq(thumbnail)      
    end
  end

  describe "search_all" do
    it "returns a set of deserialized books" do 
      count = 3
      response_items = build_stub_response(count: count)
      allow(Net::HTTP).to receive(:get).and_return(response_items)

      adapter = LibraryAdapter.new
      title = "The Great Novel"
      author = "Writey McWriterson"

      expect(adapter.search_all(title, author).size).to eq(count)
      expect(adapter.search_all(title, author)).to all( be_a(LibraryAdapter::DeserializedBook) )
    end
  end
end