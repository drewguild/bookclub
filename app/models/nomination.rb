class Nomination < ApplicationRecord
    has_one :book
    has_one :member
end
