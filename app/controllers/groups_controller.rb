class GroupsController < ApplicationController
  before_action :activate_session

  def index
    @groups = current_user.groups
    @group = Group.new
  end

  def create
    @group = Group.create(group_params)
    if @group.save
      @group.rooms << Room.new(name: "General")
      @group.users << current_user
      redirect_to groups_path
    else
      @group.errors.full_messages
      render "/groups/new"
    end
  end

  def show
    @group = Group.find(params[:id])
    redirect_to groups_path unless @group.users.include?(current_user)
    @rooms = @group.rooms
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end

end
