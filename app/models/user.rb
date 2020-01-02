class User < ApplicationRecord
  validates :email, uniqueness: true, presence: true
  validates :username, uniqueness: true, presence: true
  validates_confirmation_of :password

  has_secure_password
  enum role: ['regular', 'admin']
end
