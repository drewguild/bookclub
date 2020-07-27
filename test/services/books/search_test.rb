require "test_helper"

class Books::SearchTest < ActiveSupport::TestCase
  test ".call returns an empty array when there's no results" do
    search = Books::Search.new 
    mockAdapter = Minitest::Mock.new
    def mockAdapter.search_all(*) []; end

    LibraryAdapter.stub :new, mockAdapter do 
      results = search.call
      assert_equal 0, results.size
    end
  end

  test ".call returns a set of BookSearchResults" do
    stub_results = 3.times.map { |i| LibraryAdapter::DeserializedBook.new({}) }
    search = Books::Search.new({title: "title", author: "author" }) 
    mockAdapter = Minitest::Mock.new
    mockAdapter.expect(
      :search_all, 
      stub_results,
      ["title", "author"]
    )
    
    LibraryAdapter.stub :new, mockAdapter do 
      results = search.call
      assert_equal stub_results.size, results.size
      results.each do |result|
        assert_respond_to result, :title
        assert_respond_to result, :author
        assert_respond_to result, :description
      end
    end

    assert_mock mockAdapter
  end
end