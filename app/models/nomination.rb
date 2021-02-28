class Nomination < ApplicationRecord
    belongs_to :book
    belongs_to :member
    has_many :votes

    validates :member_id, uniqueness: { message: 'may only nominate one book at a time' }
end
