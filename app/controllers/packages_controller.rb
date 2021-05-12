class PackagesController < ApplicationController
	def new
		@package =Package.new
	end
	def create
		@package = Package.new(package_params)
		@package.package_places = params[:package_places]
		@package.save
	end
	def index
		@packages=Package.all
	end
	def conversion
		@package = Package.find(params[:id])
		@money = Money.us_dollar(@package.price).exchange_to("EUR")
	end
	private
	def package_params
		params.permit(:package_places,:price)
	end
end
