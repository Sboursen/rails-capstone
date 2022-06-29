class CategoriesController < ApplicationController
  def index
    @current_user = current_user
    @categories = @current_user.categories.order('updated_at DESC')
  end

  def new; end

  def create
    @category = Category.new(category_params)
    @category.author_id = current_user.id
    if @category.save
      flash[:notice] = 'Your category was successfully created'
      redirect_to categories_path
    else
      flash[:notice] = 'Failed to create the category!'
      render 'new'
    end
  end

  private

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
