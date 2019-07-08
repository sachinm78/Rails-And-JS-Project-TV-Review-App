class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :show_id, :rating, :comment

  belongs_to :show
end
