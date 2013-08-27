class Product
  include ResourceMQ::Resource

  service :products do
    message :products do
      repeated :items, :product
    end

    message :product do
      required :id, Integer
      required :name, String
      required :description, String
      required :price_in_cents, Integer
    end

    action :index, response: :products do
      optional :page, Integer
    end

    action :create, response: :product do
      required :name, String
      required :description, String
      required :price_in_cents, Integer
    end

    action :update, response: :product do
      extends :create, except: [:name]
      required :id, Integer
    end

    action :show, response: :product do
      required :id, Integer
    end

    action :destroy, response: :product do
      required :id, Integer
    end
  end
end
