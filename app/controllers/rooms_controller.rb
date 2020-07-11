class RoomsController < ApplicationController
  def show
    @room = Room.find(params[:id])
    @room.entries.each do |entry|
      unless entry.user == current_user
        @user = entry.user
      end
    end
    @messages = Message.where(room_id: params[:id])
    @message =Message.new
    notifications = MessageNotification.where(room_id: @room.id).where(sender_id: @user.id).where(checked_status: 0)
    notifications.each do |notification|
      notification.update(checked_status: 1)
    end
  end

  def index
    my_entries = current_user.entries
    # current_userの属しているroom_idを配列に入れていく
    room_ids = []
    my_entries.each do |my_entry|
      room_ids.push(my_entry.room_id)
    end
    @other_entries = Entry.where(room_id: room_ids).where.not(user_id: current_user.id)
  end

  def create
    @user = User.find(params[:user_id])
    # roomが既に存在する場合-----
    unless @user == current_user
      my_entries = Entry.where(user_id: current_user.id)
      # 一致するroom_idを見つける。
      my_entries.each do |my_entry|
        @user.entries.each do |user_entry|
          if my_entry.room_id == user_entry.room_id
            @room = Room.find(my_entry.room_id)
          end
        end
      end
    end
    # roomが存在しない場合------------
    unless @room
      @room = Room.create!
      my_entry = Entry.create(user_id: current_user.id, room_id: @room.id)
      another_entry = Entry.create(user_id: @user.id, room_id: @room.id)
    end
    redirect_to room_path(@room)
  end
end
