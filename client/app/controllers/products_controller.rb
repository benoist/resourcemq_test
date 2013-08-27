class ProductsController < ApplicationController

  def index
    @products = Product.index(page: params[:page])
  end

  def show
    @product = Product.show(id: params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    @product.create

    if @product.created?
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.show(id: params[:id])
  end

  def update
    @product = Product.show(id: params[:id])
    @product.update(params[:product])

    if @product.updated?
      redirect_to @product
    else
      render :edit
    end
  end

  def destroy
    @product = Product.destroy(id: params[:id])

    if @product.destroyed?
      redirect_to products_path
    else
      redirect_to @product
    end
  end

  def publish
    @product = Product.publish(id: params[:id])

    if @product.saved?
      flash[:notice] = 'Product published'
    else
      flash[:error] = 'Product not published'
    end

    redirect_to @product
  end
end
