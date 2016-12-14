class LikesController < ApplicationController
	def create
		like = Like.create(secret_id:params[:secret_id])
		redirect_to '/secrets'
	end
end
