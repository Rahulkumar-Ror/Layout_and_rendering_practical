class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :auth_admin, except: [:show]
  def index
    @products = Product.all
  end

  def show
  end

  def new
    @product = Product.new
  end

  def edit
  end

  def create
    @product = Product.new(create_product)
      if @product.save
        flash[:notice] = "Product successfully edited"
        redirect_to admin_products_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def update
    @product.update(create_product)
    if @product.valid?
      flash[:notice] = "Product has been successfully edited......."
      redirect_to admin_products_path
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def destroy 
    @product.destroy
    redirect_to admin_products_path
  end

  private

  def find_product
    @product = Product.find_by_id(params[:id])
  end

  def create_product
    params.require(:product).permit(:title, :description, :price)
  end
end
