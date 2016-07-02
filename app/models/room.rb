class Room < ApplicationRecord

  has_many :memberships
  has_many :messages
  has_many :users, through: :memberships

end
