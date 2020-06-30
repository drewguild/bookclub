class MemberWithCollections
  attr_reader :member

  delegate :first_name, :last_name, to: :member
  def initialize(member)
    @member = member
  end

  def to_read_collection
    member.collections.find_or_create_by!(type: Collection::Types::TO_READ)
  end

  def books_to_read
    to_read_collection.books
  end

  def is?(_member)
    member.id == _member.id
  end
end