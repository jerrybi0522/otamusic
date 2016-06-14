class SessionsController < ApplicationController
  def create
  	@user = User.where(username: params[:username]).first
  	if @user && @user.authenticate(params[:password])
  		log_in(@user)
  		redirect_to root_path
  	else
  		flash[:alert] = "Log in failed."
  		redirect_to :back
  	end
  end

  def destroy
  	log_out
  	redirect_to root_path
  end
end
