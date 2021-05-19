class PlacesController < ApplicationController
	before_action :authenticate_user! ,except: [:index]
	def new
		@place = Place.new
	end
	# creation of a place
	def create
		@place = Place.new(place_params)
		puts @place.inspect
		@place.save
		redirect_to places_new_path,notice:"created successfully"
	end
	# displaying places
	def index
		query = params[:search_places].presence && params[:search_places][:query]
		if query !=nil
			# for displaying records of seach using elastic search 
			@places = Place.__elasticsearch__.search(query).records
		else
			@places = Place.all
		end

	end
	# calculating distance between cities
	def distance
		@city1 = params[:city1]
		@city2 = params[:city2]
		@distance = Geocoder::Calculations.distance_between(@city1,@city2)
		respond_to do |format|
			format.json {render :json=>@distance.round(2)}
		end
	end
	# displaying place details
	def show
		@place= Place.find(params[:id])
	end

	private

	def place_params
		params.permit(:country,:place_name,:place_description)
	end
end
