class WelcomeController < ApplicationController
	def index
		@photos = Photo.where(:public => true)
	end
end