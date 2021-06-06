class Comment < ApplicationRecord
  validates :review, :stars, presence: true
  belongs_to :tv_seriel
  belongs_to :user
end
