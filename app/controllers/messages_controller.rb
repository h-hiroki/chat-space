class MessagesController < ApplicationController

  def index
    @message = Message.new
  end

  def create
    @message = Message.new(get_msg_params)
    if @message.save
      redirect_to group_messages_path, notice: 'メッセージを作成しました'
    else
      redirect_to group_messages_path, alert: 'メッセージを入力してください'
    end
  end

  private
  def get_msg_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
