class ShowSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :title, :genre

  has_many :reviews
end
