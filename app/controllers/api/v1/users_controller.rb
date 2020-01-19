module Api
	module V1
		class UsersController < ApplicationController
			before_action :authenticate_request, only: [:delete,:update,:create,:bowling,:batting]
			def index
				if params[:name]!=nil
					user = User.where(name: params[:name])
					render json: user, status:200	
				else
					users = User.order('name ASC');
					render json: users, status:200 
				end
			end

			def show
				user = User.find(params[:id])
				render json: user, status:200	
			end

			def create
				user=User.new(user_params)
				if user.save
					render json: user, status:200
				else
					render json: {message:"user not created"}, status:400
				end
			end

			def performance
				battingP=BattingPerformance.where(user_id:params[:id])
				bowlingP=BowlingPerformance.where(user_id:params[:id])
				battingOP=BattingPerformance.select("SUM(runs) AS total_runs, SUM(balls) AS total_balls, SUM(fours) AS total_fours, SUM(sixes) AS total_sixes, COUNT(match_id) AS total_matches, COUNT(CASE WHEN out is false then 1 ELSE NULL END) AS notouts").where(user_id:params[:id])
				bowlingOP=BowlingPerformance.select("SUM(runs) AS total_runs, SUM(overs) AS total_overs, SUM(wickets) AS total_wickets, COUNT(match_id) AS total_matches").where(user_id:params[:id])
				render json: {batting:{match_wise:battingP,overall:battingOP[0]},bowling:{match_wise:bowlingP,overall:bowlingOP[0]},user_id:params[:id]},status:200
			end
			def batting
				battingP = BattingPerformance.create!(batting_params)
				render json: {message:"Added"},status:200
			end
			def bowling
				bowlingP = BowlingPerformance.create!(bowling_params)
				render json: {message:"Added"},status:200
			end
			def delete
				user=User.find(params[:id])
				if user.destroy
					render json: {message:"User deleted"}, status:200
				else
					render json: {message:"User not deleted"}, status:400
				end
			end
			def update
				user=User.find(params[:id])
				if user.update_attributes(user_params)
					render json: {message:"User updated"}, status:200
				else
					render json: {message:"User not updated"}, status:400
				end
			end

			private
			def batting_params
				params.permit(:user_id,:match_id,:runs,:balls,:sixes,:fours,:out)
			end
			def bowling_params
				params.permit(:user_id,:match_id,:runs,:overs,:wickets)
			end

			def user_params
				params.permit(:name,:phone,:passout_year,:photo)
			end
		end
	end
end