class CommentsController < ApplicationController
	before_action :authenticate_user!
	def create
		@photo = current_user.photos.find params[:photo_id]
		#this does not get defined until you click create comment
		@comment = @photo.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			#show path which needs user id as well as photo id
			redirect_to [current_user, @photo]
		else
			render 'form'
		end
	end
	def destroy
		@photo = current_user.photos.find params[:photo_id]
		@comment = @photo.comments.find params[:id]
		@comment.destroy
		redirect_to [current_user, @photo]
	end
	def update
		@photo = current_user.photos.find params[:photo_id]
		@comment = @photo.comments.update(comment_params)
	end
	private
	def comment_params
		params.require(:comment).permit(:body)
	end
end