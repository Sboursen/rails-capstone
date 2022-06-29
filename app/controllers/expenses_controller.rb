class ExpensesController < ApplicationController
  def index
    @current_user = current_user
    @category = Category.find(params[:category_id])
    @expenses = @category.expenses
  end

  def new; end

  def create
    @expense = Expense.new(expense_params)
    @category = Category.find(params[:category_id])
    @expense.author_id = current_user.id
    @expense.category_id = @category.id

    if @expense.save
      flash[:notice] = 'Your expense was successfully created'
      redirect_to category_expenses(@category)
    else
      flash[:notice] = 'Failed to create the expense!'
      render 'new'
    end
  end

  private

  def expense_params
    params.require(:category).permit(:name, :amount)
  end
end
