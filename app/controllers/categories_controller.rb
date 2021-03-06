class CategoriesController < ApplicationController
  def index
    @current_user = current_user
    @order = params[:order] || 'DESC'
    @categories = @current_user.categories.order("updated_at #{@order}")
  end

  def new; end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    if @category.save
      flash[:success] = 'Your category was successfully created'
      redirect_to categories_path
    else
      flash[:error] = 'Failed to create the category!'
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
