class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  before_action :can_manage, except: [:index, :show, :create]

  before_action :authenticate_user!

  respond_to :html, :js

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = current_user.reviews.new(review_params)
    @review.save
    @product = @review.product
    respond_with(@review)
  end

  def update
    @review.update(review_params)
    respond_with(@review.product,@review)
  end

  def destroy
    @review.destroy
    head :ok
  end

  private
    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:msg, :user_id, :product_id)
    end
    def can_manage
      unless current_user and current_user.is_admin
        redirect_to :back, notice: 'Only Admin allow to manage'
      end
    end
end
