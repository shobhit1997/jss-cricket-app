module Api
	module V1
		class AuthenticationController < ApplicationController
			
			def authenticate
				command = AuthenticateUser.call(params[:username],params[:password])
				if command.success?
					render json:{auth_token: command.result}
				else
					render json: {error: command.errors}
				end
			end
			
		end
	end
	
end