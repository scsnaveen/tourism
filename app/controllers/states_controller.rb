class StatesController < ApplicationController
	# displaying states as per country
  def index
    @states = CS.states(params[:country])
  end
end
