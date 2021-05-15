class PlacesController < ApplicationController
	before_action :authenticate_user! ,except: [:index]
	def new
		@place = Place.new
	end
	def create
		@place = Place.new(place_params)
		puts @place.inspect
		@place.save
		redirect_to places_new_path,notice:"created successfully"
	end
	def index
		query = params[:search_places].presence && params[:search_places][:query]
		if query !=nil
			# @places =Place.search(query)
			@places = Place.__elasticsearch__.search(query).records
		else
			@places = Place.all
		end

	end
	def distance
		@city1 = current_user.state
		@city2 = params[:city2]
		@distance = Geocoder::Calculations.distance_between(@city1,@city2)
		puts @city2.inspect
		puts @distance.inspect
		respond_to do |format|
			format.json {render :json=>@distance}
		end
	end
	def search
  	query = params[:search_places].presence && params[:search_places][:query]
	if query
	    # @places =Place.search(query)
	    @places = Place.__elasticsearch__.search(query).records
		end
	end

	private

	def place_params
		params.permit(:country,:place_name,:place_description)
	end
end
