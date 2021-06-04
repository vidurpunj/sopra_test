class TvSeriel < ApplicationRecord
  validates :name, presence: true
  has_many :comments
end
