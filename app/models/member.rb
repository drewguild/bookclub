class Member < ApplicationRecord
  belongs_to :club
  has_many :nominations

  def name
    "#{first_name} #{last_name}"
  end
end
