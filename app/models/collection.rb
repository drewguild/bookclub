class Collection < ActiveRecord::Base
  self.inheritance_column = ""
  belongs_to :club
  has_many :books_collections, class_name: "BooksCollections"
  has_many :books, through: :books_collections 

  module Types
    READ = "READ"
  end
end