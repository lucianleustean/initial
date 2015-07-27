class Quote
  include Mongoid::Document
  field :quote, type: String
  validates_presence_of :quote
end
