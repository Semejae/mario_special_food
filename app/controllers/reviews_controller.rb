class ReviewsController < ApplicationController
  before_action: authenticate_user!, only: [:new, :create]
  before_action: only => [:edit, :update, :destroy] do
    redirect_to new_user_session_path unless current_user && current_user.admin
  end
  
  def new 
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "review added!"
      redirect_to product_path(@product)
    else 
      render :new
    end
  end

  def show 
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit 
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "review updated!"
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      render :edit
    end
  end
  
  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "review destroyed!"
    redirect_to product_path(@review.product)
    
  end


  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end
end