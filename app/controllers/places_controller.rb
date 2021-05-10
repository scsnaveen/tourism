class PlacesController < ApplicationController
	def new
		@place = Place.new
	end
	def create
		@place = Place.new(place_params)
		@place.save
		redirect_to places_new_path,notice:"created successfully"
	end
	def index
		@places = Place.all
	end
	def distance
		puts "======================="
		puts request.location.city.inspect
		puts request.ip.inspect
		puts "======================="

	end
	private

	def place_params
		params.permit(:country_id,:place_name,:place_description)
	end
end
