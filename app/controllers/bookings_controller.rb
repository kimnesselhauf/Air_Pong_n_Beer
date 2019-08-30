class BookingsController < ApplicationController
  before_action :find_listing, only: %i[new confirm create]

  def new
    @booking = Booking.new
  end

  def create
    if current_user.nil?
      redirect_to new_user_registration_path
    else
      @booking = Booking.new(booking_params)
      @booking.user = current_user
      @booking.listing = @listing
      if @booking.save
        redirect_to listing_confirm_booking_path
      else
        render :new
      end
    end
  end

  def confirm
    @booking = @listing.bookings.last
    @booking_length = (@booking.return_on - @booking.pickup_on).to_i
    @total_price = @listing.price.to_i * @booking_length
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  private

  def find_listing
    @listing = Listing.find(params[:listing_id])
  end

  def booking_params
    params.require(:booking).permit(:pickup_on, :return_on, :listing_id, :note)
  end
end
