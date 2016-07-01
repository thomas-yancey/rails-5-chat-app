class Room < ApplicationRecord
  belongs_to :group
  has_many :messages
  has_many :users, through: :group


end
