class Collection < ActiveRecord::Base
  self.inheritance_column = ""
  belongs_to :owner, polymorphic: true
  has_many :books_collections, class_name: "BooksCollections"
  has_many :books, through: :books_collections 

  module Types
    READ = "READ"
    TO_READ = "TO_READ"

    ALL = [READ, TO_READ]
  end
end