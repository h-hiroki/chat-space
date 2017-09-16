class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def edit
    get_group_params
  end

  def create
    @group = Group.create(create_params)
    if @group.save
      redirect_to root_path, notice: 'グループを作成しました'
    else
      render :new
    end
  end

  def update
    get_group_params
    @group.update(create_params)
    redirect_to root_path, notice: 'グループを編集しました'
  end

  private
  def create_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def get_group_params
    @group = Group.find(params[:id])
  end
end
