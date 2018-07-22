class PostSerializer < ActiveModel::Serializer
  attributes :id, :content
  has_many :comments, serializer: CommentMinSerializer
  belongs_to :user

end
