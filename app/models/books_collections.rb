class BooksCollections < ActiveRecord::Base
  belongs_to :collection
  belongs_to :book
end