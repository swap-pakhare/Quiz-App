class SessionsController < ApplicationController
  def new
  	puts "session user_id in new"
  	puts session[:user_id]
  	if not session[:user_id].nil?
  		user = User.find_by(id: session[:user_id])
  		redirect_to dashboard_path
  	end
  end
  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		session[:user_id] = user.id
  		puts session[:user_id]
  		puts "session assigned to user_id"
  		redirect_to dashboard_path
  	else
  		render 'new'
  	end
  end
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  def destroy
  	puts "session value at logout"
  	puts session[:user_id]
  	session.delete(:user_id)
  	@current_user = nil
  	redirect_to root_url
  end
end
