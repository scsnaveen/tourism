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
		 @value =Concurrency.convert(@package.price,params[:currency] )
			respond_to do |format|
				format.json {render :json=>@value.round(2)}
			end
	end
	def show
		@package= Package.find(params[:id])
	end
	private
	def package_params
		params.permit(:package_places,:price)
	end
end
