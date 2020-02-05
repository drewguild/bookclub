class Nomination < ApplicationRecord
    belongs_to :book
    belongs_to :member
    has_many :votes
end
