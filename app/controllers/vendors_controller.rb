class VendorsController < ApplicationController

  before_action :set_vendor, only: [:show, :edit, :destroy, :update_vendor_data]
  before_action :admin?

  def index
  end

  def show

  end

  def edit
    @sneaker = Sneaker.find(params[:sneaker_id])
    @vendor = Vendor.find(params[:id])
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
        format.html { redirect_to sneakers_admin_show_path(@vendor.sneaker), notice: 'vendor was successfully created.' }
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

  def update_vendor_data
    previous = request.referer
     VendorWorker.perform_async(@vendor.id)
      respond_to do |format|
        format.html {redirect_to previous}
      end

  end

  def destroy
    sneaker = @vendor.sneaker
    if @vendor.destroy
      respond_to do |format|
      format.html {redirect_to sneakers_admin_show_path(@vendor.sneaker), notice: 'vendor successfully destroyed'}
      end
    end

  end

private

  def vendor_params
    params.require(:vendor).permit(:name, :current_price, :url, :previous_price)
  end

  def set_vendor
    @vendor = Vendor.find(params[:id])
  end

    def admin?
      unless current_user.admin == true
      redirect_to root_path, alert: "Not authorized"
      end
    end
end
