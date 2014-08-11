class CommentsController < ApplicationController
  def index
  	@comments = Comment.all
  end

  def create
  	Product.find(prod_params[:product_id]).comments.create(com_params)
  	redirect_to '/'
  end

  private
  def com_params
  	params.require(:comment).permit(:comment)
  end

  def prod_params
  	params.require(:comment).permit(:product_id)
  end

end
