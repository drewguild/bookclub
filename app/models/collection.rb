class Collection < ActiveRecord::Base
  belongs_to :club
  has_many :books_collections, class_name: "BooksCollections"
  has_many :books, through: :books_collections 
end