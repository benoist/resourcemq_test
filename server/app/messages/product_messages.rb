class ProductMessages
  include ResourceMQ::Messages

  service :products do
    message :products do
      has_many :products

      attribute :page, Integer
      attribute :total, Integer
    end

    message :product do
      identifier :id, Integer

      attribute :name, String
      attribute :description, String
      attribute :price_in_cents, Integer
    end

    action :index, response: :products do
      attribute :page, Integer
    end

    action :create, response: :product do
      attribute :name, String
      attribute :description, String
      attribute :price_in_cents, Integer
    end

    action :update, response: :product do
      identifier :id, Integer
      extends :create, except: [:name]
    end

    action :show, response: :product do
      identifier :id, Integer
    end

    action :destroy, response: :product do
      identifier :id, Integer
    end
  end
end
