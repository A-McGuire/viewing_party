class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true
  validates :password_digest, presence: true

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :invitations
  has_many :parties, through: :invitations
end
