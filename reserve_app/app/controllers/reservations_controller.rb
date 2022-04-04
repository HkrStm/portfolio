class ReservationsController < ApplicationController
  before_action :set_reservation, only: %w[edit update destroy]

  def index
    @reservations = current_user.reservations
  end
  
  def new
    @room = Room.find_by(id: params[:id])
    @reservation = Reservation.new
  end
  
  def create
    @reservation = Reservation.new(
      reservation_params
      .merge(user_id: current_user.id)
      .merge(username: current_user.username)
      )
    if @reservation.save
      flash[:notice] = "部屋を予約しました"
      redirect_to("/reservations")
    else
      flash[:notice] = "予約に失敗しました"
      redirect_to("/reservations")
    end
  end
  
  def show
    @reservation = Reservation.where(id: params[:id])
  end
  
  def edit
    set_reservation
  end
  
  def update
    set_reservation
    if @reservation.update(
      reservation_params
      )
      flash[:notice] = "予約を変更しました"
      redirect_to("/reservations")
    else
      render "edit", status: :unprocessable_entity
    end
  end
  
  def destroy
    set_reservation
    @reservation.destroy
    flash[:notice] = "予約をキャンセルしました"
    redirect_to("/reservations")
  end

  private

  def set_reservation
    @reservation = Reservation.find_by(id: params[:id])
  end

  def reservation_params
    params.require(:reservation).permit(:number_reservations, :check_in, :check_out, :room_id, :room_name)
  end
end
