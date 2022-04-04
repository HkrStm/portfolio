class RoomsController < ApplicationController
  before_action :authenticate_user!, except: %w[index top search]
  before_action :set_room, except: %w[index new create]

  def index
    @rooms = Room.search(params[:search])
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(
      room_params
      .merge(user_id: current_user.id)
      )
    if @room.save
      flash[:notice] = "部屋を追加しました"
      redirect_to("/rooms")
    else
      render "new", status: :unprocessable_entity
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
    if @room.update(
      room_params
      )
      flash[:notice] = "部屋情報を編集しました"
      redirect_to("/rooms")
    else
      render "edit", status: :unprocessable_entity
    end
  end
  
  def destroy
    @room.destroy
    flash[:notice] = "部屋を削除しました"
    redirect_to("/rooms")
  end
  
  def top
  end
  
  def search
    @q = Room.ransack(params[:q])
    @rooms = @q.result
  end

  private

  def set_room
    @room = Room.find_by(id: params[:id])
  end

  def room_params
    params.require(:room).permit(:room_name, :introduction, :fee, :address, :room_image)
  end
end
