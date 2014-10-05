require 'rails_helper'

describe QuotesController, :type => :controller do
  describe "GET #index" do
    let!(:first_quote) { create :quote }
    let!(:second_quote) { create :quote }
    let(:quotes) { [first_quote, second_quote] }

    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response.status).to eq(200)
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end

    it "loads all of the quotes into @quotes" do
      get :index
      expect(assigns(:quotes)).to match_array(quotes)
    end
  end
end
