class QuotesController < ApplicationController
  def index
    @quotes = Quote.all
    @quote = Quote.new
  end

  def create
    @quote = Quote.new(quote_params)
    @quote.save
    redirect_to quotes_url
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:quote)
    end
end
