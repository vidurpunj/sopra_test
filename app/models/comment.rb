class Comment < ApplicationRecord
  validates :review, :rating, presence: true
  belongs_to :tv_seriel
  belongs_to :user
end
