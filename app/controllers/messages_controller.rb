class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    @message.user_id = current_user.id
    if @message.save
      @message.make_notification
    end
    @messages = Message.where(room_id: @message.room.id)
  end

  def destroy
  end

  private
  def message_params
    params.require(:message).permit(:room_id, :body)
  end
end
