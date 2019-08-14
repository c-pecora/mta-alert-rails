class TrainsController < ApplicationController

	def index
		trains = Train.all 
		render json: trains
	end

	def show
		train = Train.find(params[:id])
		render json: train
	end

end
