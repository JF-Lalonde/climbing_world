class User < ApplicationRecord
  has_secure_password
  validates :username, :password_digest, presence: true, uniqueness: true
  validates :role, presence: true
  enum role: ["default", "admin"]
end
