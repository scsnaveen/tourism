class StatesController < ApplicationController
  def index
  	puts "==============="
  	puts params[:country].inspect
    @states = CS.states(params[:country])
    puts @states.inspect
  end
end
