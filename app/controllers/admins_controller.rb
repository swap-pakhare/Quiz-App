class AdminsController < ApplicationController
	before_action :authenticate

	$temp = Hash.new

	def authenticate
		authenticate_or_request_with_http_basic do |e, p|
			@admin = Admin.where(email: e, password: p).first
			true if @admin
		end
	end

	def display
		@admins = Admin.all
	end

	def show
		@admin = Admin.find($temp[:id])
	end

	def showusers
		@users = User.all
	end

	def destroy
		puts $temp[:id]
		puts params[:id]
		if not $temp[:id] == params[:id]
			Admin.find_by(id: params[:id]).destroy
		end
		redirect_to root_path
	end

	def create
		@admin = Admin.new(admin_params)
		if @admin.save
			$temp[:id] = params[:id]
			redirect_to admin_dashboard
		end
	end

	def new
		@admin = Admin.new
	end

	def home
	end

	def admin_params
		params.require(:admin).permit(:email, :password)
	end
end
