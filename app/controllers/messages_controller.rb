class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      redirect_to room_path(message_params[:room_id])
    else
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
