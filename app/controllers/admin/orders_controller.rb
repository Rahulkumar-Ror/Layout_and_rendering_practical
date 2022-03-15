class Admin::OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :get_product, only: [:new, :create, :index]
  before_action :find_order, only: [:show, :edit, :update, :destroy]
  def index
    @orders = @product.orders
  end

  def show
  end

  def new
    @order = @product.orders.build 
  end
  
  def create
    @order = @product.orders.build(make_order)
    if @order.save
      flash[:notice] = "Order successfully created"
      redirect_to admin_product_path(@product, @order)
    else
      render :new, status: :unprocessable_entity 
    end
  end  

  def update 
    if @order.update(make_order)
      flash[:notice] = "Order successfully edited"
      redirect_to admin_order_path(@order)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @order.destroy
    redirect_to admin_order_path
  end

  def edit
  end
  
  private
  def get_product
    @product = Product.find(params[:product_id])
  end

  def find_order
    @order = Order.find(params[:id])
  end
  
  def make_order
    params.require(:order).permit(:quantity, :product_id)
  end
end
