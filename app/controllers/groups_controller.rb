class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
  end

  def create
    Group.create(create_params)
  end

  def update
  end

  private
  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end

end
