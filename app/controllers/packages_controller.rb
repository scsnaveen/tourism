class PackagesController < ApplicationController
	def new
		@package =Package.new
	end
	# creation of package
	def create
		@package = Package.new(package_params)
		@package.package_places = params[:package_places]
		@package.save
	end
	# displaying index
	def index
		@packages=Package.all
	end
	# conversion of currency
	def conversion
		@package = Package.find(params[:id])
		# conversion using concurrency gem from USD to selected currency 
		@value =Concurrency.convert(@package.price,params[:currency] )
		# sending response 
		respond_to do |format|
			format.json {render :json=>@value.round(2)}
		end
	end
	# displaying the package details
	def show
		@package= Package.find(params[:id])
	end
	private
	def package_params
		params.permit(:package_places,:price)
	end
end
