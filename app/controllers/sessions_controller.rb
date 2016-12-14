class SessionsController < ApplicationController
	def welcome
		reset_session
		redirect_to '/sessions/new'
	end

	def new
		
	end

	def create
		@user = User.find_by_email(params[:email])
		
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			flash[:notice] ="Invalid"
			redirect_to '/sessions/new'
		end
	end


	def destroy
		reset_session
		# session[:id] = nil
		redirect_to '/sessions/new'
	end
end
