class Comment < ApplicationRecord
  belongs_to :tv_seriel
  belongs_to :user
end
