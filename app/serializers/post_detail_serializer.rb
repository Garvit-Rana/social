class PostDetailSerializer < ActiveModel::Serializer
  attributes :id, :created_at, :length
    belongs_to :user
  def length
  return object.comments.length
  end

end
