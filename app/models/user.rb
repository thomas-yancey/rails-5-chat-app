class User < ApplicationRecord
  has_secure_password
  has_many :memberships
  has_many :groups, through: :memberships

  validates_uniqueness_of :username
end
