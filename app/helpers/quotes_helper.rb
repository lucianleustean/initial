module QuotesHelper
  def random_quote
    @quotes.present? ? @quotes.shuffle[0].quote : "Please use the form to add a quote!"
  end
end
