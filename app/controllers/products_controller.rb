class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :can_manage, except: [:index, :show]

  before_action :authenticate_user!, except: [:index,:show]

  respond_to :html

  def index
    if params[:category_id]
      @products = Category.find(params[:category_id]).products
    else
      @products = Product.includes(:category).all
    end

    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new

    @product = Product.new
    @product.build_category

    respond_with(@product)
  end

  def edit
  end

  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to products_path, notice: 'Product was successfully created.' }
      else
        format.html { render 'new'}
      end
    end

  end

  def update
    @product.update(product_params)
    respond_with(@product)
  end

  def destroy
    @product.destroy
    respond_with(@product)
  end

  private
    def set_product
      @product = Product.includes(:reviews).find(params[:id])
    end

    def product_params
      params.require(:product).permit(:title, :description, :category_id, category_attributes: [ :id ])
    end

    def can_manage
      unless current_user and current_user.is_admin
        redirect_to products_path, notice: 'Only Admin allow to manage'
      end
    end
end
