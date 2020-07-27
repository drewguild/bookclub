require "rails_helper"

RSpec.describe BookSearchResultsController, :type => :controller do
  before do
    allow(controller).to receive(:current_user).and_return(User.new)
  end

  describe "GET index" do
    it "returns successfully" do
      get :index

      expect(response).to have_http_status(:success)
    end
  end
end