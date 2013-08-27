class ProductsService < ResourceMQ::Service::Base
  def index
    @products = Product.all

    respond_with @products
  end

  def show
    @product = Product.find(params[:id])

    respond_with @product
  end

  def create
    @product = Product.build(params)

    if @product.save
      respond_with @product
    else
      respond_with @product, status: :unprocessable_entity
    end
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params.except(:id))
      respond_with @product
    else
      respond_with @product, status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.find(params[:id])

    @product.destroy

    respond_with @product
  end
end
