class UsersController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index
    redirect_to categories_path if current_user.present?
  end

  # GET /users/new
  def new
    redirect_to categories_path if current_user.present?
    redirect_to root_path unless current_user.present?
  end

  # GET /users/:id
  def show
    redirect_to categories_path if current_user.present?
    redirect_to root_path unless current_user.present?
  end

  # GET /users/1/edit
  def edit
    redirect_to categories_path if current_user.present?
    redirect_to root_path unless current_user.present?
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User was successfully created.'
      redirect_to categories_path
    else
      flash[:error] = 'An error happened when creating a new user.'
      render :new
    end
  end

  def destroy
    if destroy
      flash[:success] = 'You successfully logged out.'
      redirect_to root_path
    else
      flash[:error] = 'An error happened when logging out.'
      render categories_path
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = current_user
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user, {})
  end
end
