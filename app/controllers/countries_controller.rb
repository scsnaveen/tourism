class CountriesController < ApplicationController
	def new
		@country = Country.new
	end
	def create
		@country =Country.new(params.permit(:country))
		@country.save
		redirect_to countries_new_path,notice: "created successfully"
	end
end
