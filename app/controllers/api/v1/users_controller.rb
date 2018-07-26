module Api
	module V1
		class UsersController < ApplicationController
			before_action :set_api_current_user, only: [:sign_out]
			def sign_in
				user=User.find_by(email:params[:email])
				
				if !user.blank?
					if user.valid_password?(params[:password])
						user.set_auth_token
						return render json:user
					end
				end
				data={
					message: "Invalid Username or password"

				}
				return render json:data,status:401 

			end
              def sign_out
                   @user=@api_current_user
                    @user.remove_auth
                    data={
                    	message: 'you have successfully signed out'
                    }
                    return render json:data

              end

		end
	end
end