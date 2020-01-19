class ApplicationController < ActionController::API
	attr_reader :admin
	private
	def authenticate_request
		@admin = AuthorizeApiRequest.call(request.headers).result
		render json: {error:'Not Authorized'}, status:401 unless @admin
	end
	def is_super_admin
		@admin = AuthorizeApiRequest.call(request.headers).result
		puts @admin
		render json: {error:'Not Authorized'}, status:401 unless @admin && @admin[:super_admin]
	end
end
