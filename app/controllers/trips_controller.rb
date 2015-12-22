class TripsController < ApplicationController

	def index
		@trips = Trip.all
	end

	def new
		@trip = Trip.new
	end

	def create
		trip_params = params.require(:trip).permit(:name, :description)

		trip = Trip.new(trip_params)

		if trip.save
			redirect_to trip_path(trip)
		end
	end

	def show
		trip_id = params[:id]

		@trip = Trip.find_by_id(trip_id)
	end

end
