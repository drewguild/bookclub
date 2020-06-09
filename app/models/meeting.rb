class Meeting < ApplicationRecord
  belongs_to :book
  scope :upcoming, -> { where("held_on > '#{Date.today}'").order(:held_on) }

  def book
    super || NullBook.new
  end
end
