class BrandsController < ApplicationController

  before_action :admin?
  before_action :set_brand, only: [:show]

  def index
    @brands = Brand.all
  end

  def show

  end

  def edit
  end

    def new
    @brand = Brand.new
    end

  def create

    @brand = Brand.new(brand_params)

    respond_to do |format|
      if @brand.save
        format.html { redirect_to new_brand_path, notice: 'Brand was successfully created.' }
        format.json { render :show, status: :created, location: @brand }
      else

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

  def brand_params
    params.require(:brand).permit(:name, :logo, :logo_cache)
  end

  def set_brand
    @brand = Brand.find(params[:id])
  end

    def admin?
      unless current_user.admin == true
      redirect_to root_path, alert: "Not authorized"
      end
    end
end
