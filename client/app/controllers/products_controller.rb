class ProductsController < ApplicationController
  def index
    message   = Product.index(page: params[:page])
    @page     = message.page
    @total    = message.total
    @products = message.items
  end

  def show
    @product = Product.show(params[:id])
  end

  def new
    @product = Product.new
  end

  # create action: Product.create(attributes)
  # or
  # product = Product.new
  # product.description = params[:product][:description]
  # product.save
  def create
    @product = Product.create(params[:product])

    if @product.created?
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.show(params[:id])
  end

  # update action: Product.update(id, attributes)
  # or Product.show(id).update(attributes)
  # or
  # product = Product.show(id)
  # product.description = params[:product][:description]
  # product.save
  def update
    @product = Product.update(params[:id], params[:product])

    if @product.updated?
      redirect_to @product
    else
      render :edit
    end
  end

  # destroy action: Product.destroy(id)
  # or Product.show(id).destroy
  def destroy
    @product = Product.destroy(params[:id])

    if @product.destroyed?
      redirect_to products_path
    else
      redirect_to @product
    end
  end

  # publish action: Product.publish(id)
  # or Product.show(id).publish
  def publish
    @product = Product.publish(params[:id])

    if @product.saved?
      flash[:notice] = 'Product published'
    else
      flash[:error] = 'Product not published'
    end

    redirect_to @product
  end
end
