class ProductMessages
  include ResourceMQ::Messages

  message :products do
    attribute :page, Integer
    attribute :total, Integer
    attribute :items, Array[:product]
  end

  message :product do
    id :id, Integer

    attribute :name, String
    attribute :description, String
    attribute :price_in_cents, Integer
  end

  service :products do
    action :index, response: :products do
      attribute :page, Integer
    end

    action :create, response: :product do
      attribute :name, String
      attribute :description, String
      attribute :price_in_cents, Integer
    end

    action :update, response: :product do
      id :id, Integer
      extends :create, except: [:name]
    end

    action :show, response: :product do
      id :id, Integer
    end

    action :destroy, response: :product do
      id :id, Integer
    end
  end
end
