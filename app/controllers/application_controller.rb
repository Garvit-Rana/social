class ApplicationController < ActionController::Base
#  protect_from_forgery with: :exception
def set_api_current_user
	authenticate_with_http_token do |token, options|
		@api_current_user=User.find_by_auth_token(token)
      
	end
	
	if @api_current_user.blank?
		data={
			message: "you need to login first"
		}
		return render json: data,status:401
end

	end

end
