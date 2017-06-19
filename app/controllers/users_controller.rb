class UsersController < ApplicationController


  # GET /pins
  # GET /pins.json
  def index

  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @bucket = Bucket.new
    @user = current_user
  end

  # GET /pins/new
  def new

  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create

  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update

  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pin
      @pin = Pin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_params
      params.require(:bucket).permit(:description)
    end

    def correct_user
      @pin = current_user.pins.find_by(id: params[:id])
      redirect_to pins_path, notice: "Not authorized to edit pin" if @pin.nil?
    end
end