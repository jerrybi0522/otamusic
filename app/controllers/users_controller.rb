class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "The passwords did not match. Try again."
      redirect_to(:back)
    else
      if @user.save
        log_in(@user)
        redirect_to root_path
      end
    end
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if params[:user][:password] != params[:user][:password_confirmation]
      flash[:alert] = "The passwords did not match. Try again."
      redirect_to(:back)
    else
      if @user.update(user_params)
        redirect_to user_path(@user)
      end
    end
  end

  def destroy
    @user = current_user
    @user.destroy
    log_out
    redirect_to root_path
  end

  def favorite
    @user = User.find(params[:id])
  end

  def upload
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :email)
  end
end
