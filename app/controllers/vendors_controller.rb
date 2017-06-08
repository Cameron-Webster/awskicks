class VendorsController < ApplicationController

  before_action :set_vendor, only: [:show]
  def index
  end

  def show

  end

  def edit
  end

    def new
    @vendor = Vendor.new
    @sneaker = Sneaker.find(params[:sneaker_id])
    @logos = Logo.all
    end

  def create

    @vendor = Vendor.new(vendor_params)
    @vendor.logo = Logo.find(vendor_params[:name])
    @vendor.name = @vendor.logo.name
    @vendor.sneaker = Sneaker.find(params[:sneaker_id])
    respond_to do |format|
      if @vendor.save
        format.html { redirect_to @vendor.sneaker, notice: 'vendor was successfully created.' }
        format.json { render :show, status: :created, location: @vendor.sneaker }
      else
        raise
        format.html { render :new }
        format.json { render json: @vendor.errors, status: :unprocessable_entity }
      end
    end

  end



  def update
  end

  def destroy
  end

private

  def vendor_params
    params.require(:vendor).permit(:name, :current_price, :url, :previous_price)
  end

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end
end
