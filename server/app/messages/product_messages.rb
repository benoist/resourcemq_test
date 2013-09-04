resource :product do
  attribute :name, String
  attribute :description, String
  attribute :price_in_cents, Integer
  attribute :published_at, Time

  message :products do
    attribute :page, Integer
    attribute :total, Integer

    has_many :products, Product
  end

  collection do
    action :index, responds_with: :products do
      params :page, Integer
    end

    action :create, responds_with: :product do
      attribute :name, String
      attribute :description, String
      attribute :price_in_cents, Integer
      attribute :published_at, Time
    end
  end

  member do
    action :update, responds_with: :product do
      attribute :description, String
      attribute :price_in_cents, Integer
      attribute :published_at, Time
    end

    action :show, responds_with: :product
    action :destroy, responds_with: :product
    action :publish, responds_with: :product
  end
end
