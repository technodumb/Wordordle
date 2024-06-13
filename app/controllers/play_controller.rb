class PlayController < ApplicationController
  def index
  end

  def create
  end

  def join
    @room_id = params[:roomID]
  end

  def validate_room
    room_id = params[:roomID]
    if room_id == "1234"
      redirect_to join_room_path(roomID: room_id)
    else
      redirect_to index_path
    end
  end
end
