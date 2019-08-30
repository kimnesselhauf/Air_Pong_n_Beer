class ListingsController < ApplicationController
  before_action :find_listing, only: %i[show edit update destroy]

  def index
    if params[:pickup_on].present? && params[:return_on].present?
      @listings = Listing.available_on_dates([params[:pickup_on], params[:return_on]])
    else
      @listings = Listing.all
    end

    @users_geo = User.geocoded #returns flats with coordinates
    @markers = @users_geo.map do |user|
      {
        lat: user.latitude,
        lng: user.longitude,
        infoWindow: render_to_string(partial: "users/info", locals: { user: user })
      }
    end
  end

  def show
    @booking = Booking.new
  end

  def new
    @user = current_user
    @listing = Listing.new
  end

  def create
    @listing = Listing.new(listing_params)
    @listing.user = current_user
    if @listing.save
      redirect_to listings_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @listing.update(listing_params)
  end

  def destroy
    @listing.destroy
  end

  private

  def find_listing
    @listing = Listing.find(params[:id])
  end

  def listing_params
    params.require(:listing).permit(:photo, :title, :description, :price)
  end
end


# @listings_all = []
      # @listings_all << Listing.all
      # @booked_listings = []
      # @trash = []
      # @listings_all.each do |listing|
      #   listing.bookings.each do |booking|
      #     if booking.pickup_on.to_s == params[:pickup_on] && booking.return_on.to_s == params[:return_on]
      #     raise
      #       @booked_listings << booking
      #     else
      #       @trash << booking
      #     end
      #   end
      # end
