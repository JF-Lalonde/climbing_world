class User < ApplicationRecord
  has_secure_password
  has_many :comments
  has_many :users_routes
  has_many :routes, through: :users_routes
  validates :username, :password_digest, presence: true, uniqueness: true
  validates :role, presence: true
  enum role: ["default", "admin"]
end
