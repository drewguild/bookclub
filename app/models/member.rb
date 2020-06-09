class Member < ApplicationRecord
  belongs_to :club
  has_many :nominations
end
