class BookingsController < ApplicationController
  def new
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new
  end

  def create
    @listing = Listing.find(params[:listing_id])
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.listing = @listing
    if @booking.save
      redirect_to listing_confirm_booking_path
    else
      render :new
    end
  end

  def confirm
    @listing = Listing.find(params[:listing_id])
    @booking = @listing.bookings.last
  end

  private

  def booking_params
    params.require(:booking).permit(:pickup_on, :return_on, :listing_id)
  end
end
