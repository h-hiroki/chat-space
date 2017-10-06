class MessagesController < ApplicationController
  before_action :set_group, only: [:index, :create]

  def index
    @message = Message.new
    respond_to do |format|
      format.html
      format.json
    end
  end

  def create
    @message = Message.new(get_msg_params)
    if @message.save
      respond_to do |format|
        format.html {redirect_to group_messages_path, notice: 'メッセージを作成しました'}
        format.json
      end
    else
      flash[:alert] = 'メッセージを入力してください'
      render :index
    end
  end

  private
  def get_msg_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

  def set_group
    @group = Group.find(params[:group_id])
    @messages = @group.messages
  end
end
