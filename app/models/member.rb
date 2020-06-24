class Member < ApplicationRecord
  belongs_to :club
  has_many :nominations
  has_many :collections, as: :owner

  def name
    "#{first_name} #{last_name}"
  end
end
