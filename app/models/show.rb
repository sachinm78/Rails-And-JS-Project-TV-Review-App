class Show < ApplicationRecord
    has_many :reviews, :dependent => :destroy
    belongs_to :user

    validates :title, :genre, presence: true

end
