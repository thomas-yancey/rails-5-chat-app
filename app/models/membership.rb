class Membership < ApplicationRecord
  belongs_to :user
  belongs_to :room

  def name
    User.find(self.user_id).username
  end

end
