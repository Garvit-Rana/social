class User < ApplicationRecord
  # Include default devise modules. Others available are:
  #  :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


         has_attached_file :avatar, default_url: "/images/:style/missing.png"
          validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
has_many :posts
has_many :comments, dependent: :destroy
has_many :likes
end
