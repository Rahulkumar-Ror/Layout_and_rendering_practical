class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @products = Product.all
  end

  def new
  end

  def edit
  end

  private
  def create_product
    params.require(:product).permit(:title, :description, :price)
  end
end
