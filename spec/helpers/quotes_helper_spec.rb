require 'rails_helper'

describe QuotesHelper, :type => :helper do
  describe '#random_quote' do
    before(:each) do
      assign(:quotes, quotes)
    end

    context 'no quotes in the database' do
      let(:quotes) { [] }

      it 'returns a message' do
        expect(helper.random_quote).to eq("Please use the form to add a quote!")
      end
    end

    context 'several quotes are present' do
      let!(:first_quote) { create :quote, quote: 'First quote' }
      let!(:second_quote) { create :quote, quote: 'Second quote' }
      let!(:third_quote) { create :quote, quote: 'Third quote' }
      let(:quotes) { [first_quote, second_quote, third_quote] }

      it "doesn't return the add quote message" do
        expect(helper.random_quote).to_not eq("Please use the form to add a quote!")
      end

      it 'should return a string' do
        expect(helper.random_quote).to be_a String
      end

      it 'returns the first quote' do
        allow(quotes).to receive(:shuffle).and_return([first_quote])
        expect(helper.random_quote).to eq('First quote')
      end
    end
  end
end
