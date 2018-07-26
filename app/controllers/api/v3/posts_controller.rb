module Api
	module V3
		class PostsController < ApplicationController
			def index
				@posts=Post.all
				return render json:@posts  
			end
			def sign_in
				@user=User.find_by(email:params[:email])
				if !@user.blank?
					if @user.valid_password?(params[:password])
						@user.set_auth_token
						return render json:@user 


					end

				end   
				data={

					message: 'Not valid user'
				} 
				return render json:data,status:404
			end

		end

	end
end