class LogosController < ApplicationController

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


  private

  def logo_params
    params.require(:logo).permit(:name, :photo, :photo_cache, :home_url)
  end

end
