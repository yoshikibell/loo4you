class BookingsController < ApplicationController

  def index
    @bookings = policy_scope(Booking)
  end


  def create
    @booking = Booking.new
    @toilet = Toilet.find(params[:toilet_id])
    @booking.toilet = @toilet
    @user = current_user
    @booking.user = @user
    authorize @booking
    if @booking.save
      redirect_to toilet_path(@toilet), notice: "Successful booking"
    else
      render 'toilets/show'
    end
  end

  # private

  # def booking_params
  #   params.require(:booking).permit(:user_id, :toilet_id)
  # end
end