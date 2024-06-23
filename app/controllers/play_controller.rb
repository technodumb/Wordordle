class PlayController < ApplicationController
  # constants
  CORRECT = 0
  PRESENT = 1
  ABSENT = 2

  def index
    @validRoom = params[:validRoom]
    # render
  end

  def create
  end

  def generate_room
    # create a room ID which is alphanumeric and 8 characters long
    word = params[:word]
    roomID = SecureRandom.alphanumeric(8)

    while Room.exists?(roomID: roomID) do
      roomID = SecureRandom.alphanumeric(8)
    end

    room = Room.new(roomID: roomID, word: word, result: 0)
    room.save

    redirect_to join_path(roomID: roomID)
  end


  def join
    roomID = params[:roomID]
    if Room.exists?(roomID: roomID)
      @room = Room.find_by(roomID: roomID)
      # @attempts = Attempt.where(room_id: @room.id)
      render
    else
      flash[:error] = "Room does not exist"
      redirect_to index_path(validRoom: false)
    end
  end

  def guess
    # define constants for CORRECT, PRESENT, ABSENT
    guessedWord = params[:guessedWord]
    roomID = params[:roomID]
    if Room.exists?(roomID:roomID) then
      room = Room.find_by(roomID:roomID)
      correctWord = room.word
      wordLength = correctWord.length
      used = [false] * wordLength
      response = [ABSENT] * wordLength
      for i in 0...wordLength do
        if correctWord[i] == guessedWord[i] then
          response[i] = CORRECT
          used[i] = true
        end
      end
      for i in 0...wordLength do
        indI = correctWord.index (guessedWord[i])
        if indI != nil then
          if used[indI] == false then
            response[i] = PRESENT
            used[indI] = true
          end
        end
      end
    end
    render json: response
  end


end
