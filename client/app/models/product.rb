class Product
  include ResourceMQ::Resource

  # Loads the product messages class
  # The convention can be extracted messages "#{self.name}Messages".underscore, "#{self.name}".under_score
  messages :product_messages, default: :product
end
