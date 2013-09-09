resource :product do
  attribute :name, String
  attribute :description, String
  attribute :price_in_cents, Integer
  attribute :published_at, Time

  # Product Message
  # {
  #   name: 'name',
  #   description: 'description',
  #   price_in_cents: 100,
  #   published_at: 12457
  # }

  header do
    param :trace_id, String
    param :remote_ip, String
    param :token, String
  end

  collection_response :products do
    # collection_of :product # this is default :products.singularize

    attribute :page, Integer
    attribute :total, Integer
  end

  # Products Message
  # {
  #   page: 1,
  #   total: 300,
  #   products: [{
  #     name: 'name',
  #     description: 'description',
  #     price_in_cents: 100,
  #     published_at: 12457
  #   }]
  # }

  collection do
    action :index, responds_with: :products do
      param :page, Integer
    end

    # Index message
    # {
    #   page: 1
    # }

    action :create, responds_with: :product do
      attribute :name, String
      attribute :description, String
      attribute :price_in_cents, Integer
      attribute :published_at, Time
    end

    # Create message
    # {
    #   name: 'name',
    #   description: 'description',
    #   price_in_cents: 100,
    #   published_at: 12457
    # }
  end

  member do
    action :update, responds_with: :product do
      attribute :description, String
      attribute :price_in_cents, Integer
      attribute :published_at, Time
    end

    # Update message
    # {
    #   id: 1,
    #   description: 'description',
    #   price_in_cents: 100,
    #   published_at: 12457
    # }

    action :show, responds_with: :product

    # Show message
    # {
    #   id: 1
    # }

    action :destroy, responds_with: :product

    # Publish message
    # {
    #   id: 1
    # }

    action :publish, responds_with: :product

    # Publish message
    # {
    #   id: 1
    # }
  end
end
