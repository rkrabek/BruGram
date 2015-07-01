class PhotosController < ApplicationController
	before_action :authenticate_user!
	def index
		@photos = current_user.photos
	end
	def show
		@photo = current_user.photos.find params[:id]
		#this is what is passed into the rendered form on show page
		@comment = Comment.new(:photo => @photo)
		# @comment = @photo.comments.build
		#Leila added the following line and changed render @photo.comments to @comments and it worked... @comments = @photo.comments.reject(&:new_record?)
	end
	def new
		#returns the newly created object without saving it
		@photo = current_user.photos.build
	end
	def edit
		@photo = current_user.photos.find params[:id]
	end
	def create
		@photo = current_user.photos.create(photo_params)
		redirect_to user_photo_path(current_user, @photo)
	end
	def update
		@photo = current_user.photos.find params[:id]
		if @photo.update(cost_params)
			redirect_to user_photo_path(current_user, @photo)
		else
			render 'edit'
		end
	end
	def destroy 
		@photo = current_user.photos.find params[:id]
		@photo.destroy
		redirect_to user_photos_path(current_user)
	end
	private
	def photo_params
		params.require(:photo).permit(:public, :caption, :image)
	end
end