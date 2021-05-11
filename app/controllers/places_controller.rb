class PlacesController < ApplicationController
	def new
		@place = Place.new
	end
	def create
		@place = Place.new(place_params)
		puts @place.inspect
		# @place.save
		redirect_to places_new_path,notice:"created successfully"
	end
	def index
		@places = Place.all
	end
	def distance
		@city1 = params[:city1]
		@city2 = params[:city2]
		@distance = Geocoder::Calculations.distance_between(@city1,@city2)
	end
	def search
  	query = params[:search_places].presence && params[:search_places][:query]
	if query
	    # @places =Place.search(query)
	    @places = Place.__elasticsearch__.search(query).records
		end
	end
	def conversion
		Money.add_rate("USD", "EUR", 0.803115)
		 @money = Money.us_dollar(1000).exchange_to("EUR")
	end

	private

	def place_params
		params.permit(:country,:place_name,:place_description)
	end
end
