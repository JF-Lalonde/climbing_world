class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :route
  validates :content, presence: true
end
