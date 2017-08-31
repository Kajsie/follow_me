class BookingsController < ApplicationController
  def index
    if current_user.type == "guide"
      #some code to get all the bookings associated with tours that this guide runs
      @bookings = Booking.joins(:user).where(:users => {:type => "guide"})
    else
      @bookings = Booking.where(user_id: current_user.id)
    end
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @visit = Visit.find(params[:visit_id])
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.visit = Visit.find(params[:visit_id])
    @booking.confirmed = false
    @booking.user = current_user
    @booking.save
    redirect_to booking_path(@booking)
  end

  def edit
    @booking = Booking.find(params[:id])
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    @booking.save
    redirect_to bookings_path
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

end
