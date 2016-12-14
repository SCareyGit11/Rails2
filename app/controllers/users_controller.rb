class UsersController < ApplicationController
	before_action :require_login, except: [:new, :create]
	before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
	
	def index
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find(params[:id])
		@secret = @user.secrets.all
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to "/users/#{@user.id}", notice: 'User was successfully updated.' }
		        format.json { render action: 'index', status: :created, location: @user }
		    else
		        format.html { 
		        	flash['errors'] = @user.errors.full_messages

		        	redirect_to "/users/#{@user.id}/edit"
		        	# render :new
		        }
		        format.json { render json: @user.errors, status: :unprocessable_entity }
		    end
		end
	end

	def destroy
		User.delete(params[:id])
		redirect_to '/sessions/new'
	end

	def create
		@user = User.new(user_params)
		respond_to do |format|
	      if @user.save
	        format.html { redirect_to "/users/#{@user.id}", notice: 'User was successfully created.' }
	        format.json { render action: 'index', status: :created, location: @user }
	      else
	        format.html { 
	        	flash['errors'] = @user.errors.full_messages

	        	redirect_to '/users/new'
	        	# render :new
	        }
	        format.json { render json: @user.errors, status: :unprocessable_entity }
	      end
	    end
	end

	private
	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end
end
