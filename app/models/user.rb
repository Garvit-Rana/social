class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,:omniauthable,  omniauth_providers: [:google_oauth2]


  has_attached_file :avatar,default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  has_many :posts
  has_many :comments, dependent: :destroy
  has_many :likes

  def self.from_omniauth(data)
  	user=User.find_by(email: data.email)
  	if user.blank?
  		user=User.create(
  			email:data.email,
  			password:SecureRandom.uuid

  			)

  	end

  	return user
  end
  def set_auth_token
  	self.auth_token=SecureRandom.uuid
  	self.save
  end
def remove_auth


end


end
