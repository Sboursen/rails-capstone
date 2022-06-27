class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users or /users.json
  def index; end

  # GET /users/new
  def new; end

  # GET /users/1/edit
  def edit; end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'User was successfully created.'
      redirect_to root_path
    else
      flash[:error] = 'An error happened when creating a new user.'
      render :new
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
