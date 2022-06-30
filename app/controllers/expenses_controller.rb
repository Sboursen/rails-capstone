require 'date'

class ExpensesController < ApplicationController
  def index
    @current_user = current_user
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses.order('created_at DESC')
  end

  def new
    @category = Category.find(params[:category_id])
    @user = current_user
  end

  def create
    @expense = Expense.new(expense_params)
    @category = Category.find(params[:category_id])
    @expense.author_id = current_user.id
    @expense.categories << @category

    if @expense.save!
      @category.update!(updated_at: DateTime.now)
      flash[:success] = 'Your expense was successfully created'
      redirect_to category_expenses_path(@category)
    else
      flash[:error] = 'Failed to create the expense!'
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:expense).permit(:name, :amount)
  end
end
