class Product
  include ResourceMQ::Resource

  attribute :id, Integer
  attribute :name, String
  attribute :description, String
  attribute :price_in_cents, Integer
  attribute :published_at, Time
end

class Products
  include ResourceMQ::Message

  attribute :page, Integer
  attribute :total, Integer

  has_many :products, Product
end

service :products, response: Products do
  collection :index do
    attribute :page, Integer
  end

  # Defaults to all attributes
  collection :create, response: Product do
    attributes_for Product
  end

  # Defaults to all but can be overwritten
  member :update, response: Product do
    attributes_for Product, only: [:description, :price_in_cents]
    #attributes_for Product, except: [:name]
  end

  member :show, response: Product
  member :destroy, response: Product
  member :publish, response: Product
end
