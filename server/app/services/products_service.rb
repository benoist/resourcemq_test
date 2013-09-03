class ProductsService < ResourceMQ::Service::Base
  def index
    @products = Product.paginate(message.page)

    respond_with page: message.page, total: Product.total, items: @products
  end

  def show
    @product = Product.find(message.id)

    respond_with @product
  end

  def create
    @product = Product.build(message.attributes)

    if @product.save
      respond_with @product
    else
      respond_with errors: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(message.id)

    if @product.update_attributes(message.attributes)
      respond_with @product
    else
      respond_with errors: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(message.id)

    @product.destroy

    respond_with @product
  end

  private

  def respond_with(*args)

  end
end
