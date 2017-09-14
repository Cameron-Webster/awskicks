class LogosController < ApplicationController

  before_action :set_logo, only: [:edit, :destroy, :update]
  before_action :admin?

  def index

    @logos = Logo.all
  end

  def new
    @logo = Logo.new
  end


    def create
    @logo = Logo.new(logo_params)

    respond_to do |format|
      if @logo.save

        format.html { redirect_to root_path, notice: 'Pin was successfully created.' }
        # format.json { render :show, status: :created, location: @sneaker }
      else
        format.html { render :new }
        # format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit

  end

  def update
    respond_to do |format|
      if @logo.update(logo_params)

        format.html { redirect_to new_logo_path, notice: 'Logo was successfully updated.' }
        format.json { render :show, status: :ok, location: @logo }
      else
        format.html { render :edit }
        format.json { render json: @logo.errors, status: :unprocessable_entity }
      end
    end
  end

   def destroy
    @logo.destroy
    respond_to do |format|
      format.html { redirect_to new_logo_path, notice: 'logo deleted!' }
      format.json { head :no_content }
    end
  end

  private

  def logo_params
    params.require(:logo).permit(:name, :photo, :photo_cache, :home_url, :scraper)
  end
  def set_logo
    @logo = Logo.find(params[:id])
  end

 def admin?
      unless current_user.admin == true
      redirect_to root_path, alert: "Not authorized"
      end
  end

end
