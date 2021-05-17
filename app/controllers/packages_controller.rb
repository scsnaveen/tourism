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
		Money.add_rate("USD", params[:currency], ConversionRate.where(currency_code: params[:currency]).first.conversion_rate)
		@money = Money.us_dollar(@package.price).exchange_to(params[:currency])
		respond_to do |format|
			format.json {render :json=>@money.cents}
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
