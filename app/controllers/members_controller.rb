class MembersController < ApplicationController
  def show
    current_member
    @member = MemberWithCollections.new(Member.find(params[:id]))
  end
end