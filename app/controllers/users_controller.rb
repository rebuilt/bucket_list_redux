class UsersController < ApplicationController
  before_action :ensure_admin, only: %i[edit update]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to ideas_path
    else
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update(edit_user_params)
      redirect_to account_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def edit_user_params
    params.require(:user).permit(:email, :name, :avatar_url, :role)
  end

  def ensure_admin
    redirect_to account_path unless current_user.role == 'admin'
  end
end
