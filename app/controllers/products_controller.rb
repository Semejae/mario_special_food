class ProductsController < ApplicationController

  def index
    @product = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end
  
  def create
    @product = Product.new
    if @product.save
      redirect_to product_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to product_path
  end

  private 
  def product_params
    params.require(:product).permit(:name)
  end

end