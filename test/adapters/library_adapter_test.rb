require "rspec"
require "./app/adapters/library_adapter"

describe "LibraryAdapter" do
  describe "search" do 

    def build_stub_response(options = {})
      {
        "items" => [
          "volumeInfo" => {
            "description" => options[:description] || "",
            "imageLinks" => {
              "smallThumbnail" => options[:thumbnail] || ""
            }
          }
        ]
      }.to_json
    end

    it "queries the external api" do
      title = "Title"
      author = "Author Name"
      expected_uri = URI(LibraryAdapter::BASE_URL + "title+author+name")

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
end