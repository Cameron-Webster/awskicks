class PinsController < ApplicationController
  before_action :set_pin, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:index, :show]
  # before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @pins = Pin.all
  end


  def show

  end


  def new
    @pin = Pin.new
  end


  def edit

  end

  def create_stock_watch
    # raise
      @sneaker_id = params[:id]
      @pin = current_user.pins.where('sneaker_id = ?', @sneaker_id).last
      respond_to do |format|
      if @pin.update(stock_watch: 500)
        format.js
      else
        format.js { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end


  def create
    @pin = current_user.pins.new(bucket: Bucket.find(pin_params[:bucket]),
                                price_watch: pin_params[:price_watch],
                                sneaker: Sneaker.find(pin_params[:sneaker]))


    respond_to do |format|
      if @pin.save
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.js
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end



  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy



    @pin = current_user.pins.find_by bucket_id: params[:bucket_id], sneaker_id: params[:id]
    @pin.destroy
    respond_to do |format|
      format.html { redirect_to bucket_path(params[:bucket_id]), notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pin_params
      params.require(:pin).permit(:bucket, :sneaker, :stock_watch, :price_watch)
    end

    # def correct_user
    #   @pin = current_user.pins.find_by(id: params[:id])
    #   redirect_to pins_path, notice: "Not authorized to edit pin" if @pin.nil?
    # end
end
