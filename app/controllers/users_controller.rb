class UsersController < ApplicationController
  def profile
  @user=User.find(params[:id])


  end
def upload
@user=User.find(params[:id])
@user.avatar=params[:user][:avatar]
@user.save
redirect_to request.referrer
end

def user_search
term=params[:term]
users=User.where('email like ?',"%#{term}%")
data=[]
users.each do |u|
data<<{
id: u.id,
label:u.email,
value: u.email
}
end
return render json:data

end

end
