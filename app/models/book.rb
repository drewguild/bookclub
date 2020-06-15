class Book < ApplicationRecord
  has_many :books_collections, class_name: "BooksCollections"
  has_many :collections, through: :books_collections
  has_many :reviews
end
