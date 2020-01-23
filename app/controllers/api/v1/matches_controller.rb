module Api
	module V1
		class MatchesController < ApplicationController
			before_action :authenticate_request, only: [:delete,:update,:create]

			def index
				puts Time.now
				matchesP = Match.where("time < ?", Time.now).order('time ASC')
				matchesUP = Match.where("time >= ?", Time.now).order('time ASC')
				render json: {past:matchesP,upcoming:matchesUP}, status:200
			end
			def show
				match = Match.find(params[:id])
				render json: match, status:200
			end
			def create
				match = Match.create!(match_params)
				render json: match, status:200
			end
			def update
				match= Match.find(params[:id])
				if match.update_attributes(match_params)
					render json: {message:"Match updated"},status:200
				else
					render json: {message:"Match not updated",error:match.errors},status:400
				end
			end

			def destroy
				match= Match.find(params[:id])
				if match.destroy
					render json: {message:"Match deleted"},status:200
				else
					render json: {message:"Match not deleted",error:match.errors},status:400
				end
			end
			private
			def match_params
				params.permit(:team1,:team2,:winner,:venue,:time)
			end
		end
	end
end