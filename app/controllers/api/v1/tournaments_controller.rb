module Api
	module V1
		class TournamentsController < ApplicationController
			before_action :authenticate_request, only: [:delete,:update,:create]

			def index
				tournaments = Tournament.all
				render json: tournaments, status:200
			end
			def show
				tournament = Tournament.find(params[:id])
				render json: tournament, status:200
			end
			def create
				tournament = Tournament.create!(tournament_params)
				render json: tournament, status:200
			end
			def update
				tournament= Tournament.find(params[:id])
				if tournament.update_attributes(tournament_params)
					render json: {message:"Tournament updated"},status:200
				else
					render json: {message:"Tournament not updated",error:match.errors},status:400
				end
			end

			def destroy
				tournament= Tournament.find(params[:id])
				if tournament.destroy
					render json: {message:"Tournament deleted"},status:200
				else
					render json: {message:"Tournament not deleted",error:match.errors},status:400
				end
			end
			private
			def tournament_params
				params.permit(:name,:venue,:result,:date)
			end
		end
	end
end