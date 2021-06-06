class TvSeriel < ApplicationRecord
  validates :name, :actor, presence: true
  has_many :comments
end
