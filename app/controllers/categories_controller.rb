class CategoriesController < ApplicationController
  def index
    @current_user = current_user
    @categories = @current_user.categories
  end

  private

  def categories_params
    params.require(:category).permit(:name, :icon)
  end
end
