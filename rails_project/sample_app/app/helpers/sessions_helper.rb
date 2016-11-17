module SessionsHelper

	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def signed_in?
		!current_user.nil?
	end
  
	def current_user=(user)
		@current_user = user
	end

	def current_user
		@current_user ||= User.find_by_remember_token(cookies[:remember_token])
	end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end

# Why not to be used?
# def current_user
# 	@current_user     # Useless! Don't use this line.
# end
# Where is assignment used?


#I am able to see a fault in session creation. It just creates when there
#is saving of the model.