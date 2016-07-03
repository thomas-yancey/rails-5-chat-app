class MembershipsController < ApplicationController

  def index
    @memberships = Membership.where(room_id: params[:room_id])
    @users = User.where.not(id: @memberships.pluck(:user_id))
    @room = Room.find(params[:room_id])
  end

  def create
    user = User.find(params[:user_id])
    membership = Membership.new(user_id: user.id, room_id: params[:room_id])
    if membership.save
      json_hash = {username: user.username, id: user.id}
      render text: JSON.generate(json_hash)
    else
      render json: {status: fail}
    end
  end

end
