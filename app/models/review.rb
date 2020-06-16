class Review < ApplicationRecord
  belongs_to :book
  belongs_to :member

  def written_by?(_member)
    _member == member
  end
end