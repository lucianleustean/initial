require 'rails_helper'

describe "quotes/index.html.haml" do
  before(:each) do
    assign(:quotes, quotes)
  end

  context 'render view items' do
    let(:quotes) { [] }

    it 'renders _form partial' do
      visit quotes_path
      expect(view).to render_template(:partial => "_form", :count => 1)
    end
  end
end
