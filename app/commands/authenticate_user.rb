class AuthenticateUser
	prepend SimpleCommand

	def initialize(username, password)
		@username = username
		@password = password
	end

	def call
		JsonWebToken.encode(admin_id: admin.id) if admin
	end

	private 

	attr_accessor :username, :password

	def admin
		admin = Admin.find_by(username:username)
		return admin if admin && admin.authenticate(password)
		errors.add :user_authentication, 'invalid credentials'
		nil
	end
end
