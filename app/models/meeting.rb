class Meeting < ApplicationRecord
    scope :upcoming, -> { where("held_on > '%{Date.today}'").order(:held_on) }
end
