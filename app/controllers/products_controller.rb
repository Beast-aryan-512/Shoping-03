class ProductsController < ApplicationController
  
  def index
    @products = Product.all
  end
 
  def show
    @product = Product.find(params[:id])
  end
  
  def new
    @product = Product.new
  end
 
  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    if @product.destroy
      redirect_to @product, notice: "Product deleted."
    end

  end

  private
    
    def product_params
      params.require(:product).permit(:id, :name, :discription, :quantity, :price, :user_id)
    end
end
