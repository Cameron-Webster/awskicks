class UsersController < ApplicationController
  before_action :set_user

  # GET /pins
  # GET /pins.json
  def index

  end

  # GET /pins/1
  # GET /pins/1.json
  def show
    @bucket = Bucket.new

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

    def set_user
      @user = current_user
    end

    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :profile_pic, :profile_pic_cache)
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
