module Api
	module V1
		class AdminsController < ApplicationController
			before_action :is_super_admin

			def index
				admins = Admin.all
				render json: admins, status:200
			end
			def show
				admin = Admin.find(params[:id])
				render json: admin, status:200
			end
			def create
				admin = Admin.create!(admin_params)
				render json: admin, status:200
			end
			def update
				admin= Admin.find(params[:id])
				if admin.update_attributes(admin_params)
					render json: {message:"Admin updated"},status:200
				else
					render json: {message:"Admin not updated",error:match.errors},status:400
				end
			end

			def destroy
				admin= Admin.find(params[:id])
				if admin.destroy
					render json: {message:"Admin deleted"},status:200
				else
					render json: {message:"Admin not deleted",error:match.errors},status:400
				end
			end
			private
			def admin_params
				params.permit(:username,:password,:super_admin)
			end
		end
	end
end