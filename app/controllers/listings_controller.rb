class ListingsController < ApplicationController
  before_action :find_listing, only: %i[show edit update destroy]

  def index
    @listings = Listing.all
  end

  def show
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
