class ProductsController < ApplicationController

  def index
    @products = Product.index(page: params[:page])
  end

  def show
    @product = Product.show(params[:id])
  end

  def new
    @product = Product.new
  end

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

  def update
    @product = Product.update(params[:id], params[:product])

    if @product.updated?
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.destroy(params[:id])

    if @product.destroyed?
      redirect_to products_path
    else
      redirect_to @product
    end
  end

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
