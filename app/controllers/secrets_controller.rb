class SecretsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	def index
		@secret = Secret.all
	end

	def create
		
		
		#  this works with current_user input in the new secret form
		
		# secret = Secret.create(secret_params)
		# # @secret = Secret.all
		# redirect_to "/users/#{current_user.id}"
		# # redirect_to "/secrets"

		# from the answer sheet, this works
	    secret = Secret.new(content: secret_params['content'], user: current_user)
	    flash["success"] = "Secret added!" if secret.save
	    redirect_to "/users/#{current_user.id}"
  	end

  	def destroy
  		secret = Secret.find(params[:id])
  		# from the platform
  		secret.destroy if secret.user == current_user
  		redirect_to ("/users/#{current_user.id}")
  	end

	private
	def secret_params
		params.require(:secret).permit(:content, :user_id)
	end
end
