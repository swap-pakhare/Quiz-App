class UsersController < ApplicationController
  def new
  	@user = User.new
  end
  def show
  	@user = User.find(params[:id])
  end
  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:user_id] = @user.id
  		redirect_to dashboard_path
  	else
  		render 'new'
  	end
  end
  def home
    @user = User.find(session[:user_id])
    render 'dashboard'
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
  end

  def destroy
    User.find(params[:id]).destroy
    redirect_to admin_dashboard_path
  end

end
