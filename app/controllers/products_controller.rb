class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
    @comment = Comment.new
  end

  def new
    @product = Product.new
    @categories = Category.all
  end

  def edit
    @id = params[:id]
    @categories = Category.all
  end

  def create
    Category.find(cat_params[:category]).products.create(prod_params)
    redirect_to '/'
  end

  def update
    Product.find(params[:id]).update(prod_params)
    Category.find(cat_params[:category]).products << Product.find(params[:id])
    redirect_to '/'
  end

  def destroy
    Product.find(params[:id]).delete
    redirect_to '/'
  end

  private
  def prod_params
    params.require(:product).permit(:name, :description, :pricing)
  end

  def cat_params
    params.require(:product).permit(:category)
  end
end
