class PhotosController < ApplicationController
	before_action :authenticate_user!
	def index
		@photos = current_user.photos
	end
	def show
		@photo = current_user.photos.find params[:id]
	end
	def new
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
	private
	def photo_params
		params.require(:photo).permit(:public, :caption, :image)
	end
end