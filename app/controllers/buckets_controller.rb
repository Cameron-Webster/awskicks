class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]
   before_action :set_user, only: [:create, :destroy, :update]

  # GET /pins
  # GET /pins.json
  def index
    @buckets = Bucket.all
  end

  # GET /pins/1
  # GET /pins/1.json
  def show

    @pins = @bucket.pins

  end

  # GET /pins/new
  def new
     respond_to do |format|
        format.html
        format.js
    end
  end

  # GET /pins/1/edit
  def edit
  end

  # POST /pins
  # POST /pins.json
  def create
    @bucket = current_user.buckets.build(bucket_params)

    respond_to do |format|
      if @bucket.save
        format.js
        format.html { redirect_to @user, notice: 'bucket created - time to add some kicks'}
      else
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @pin.update(pin_params)
        format.html { redirect_to @pin, notice: 'Pin was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @bucket.destroy
    respond_to do |format|
      format.html { redirect_to @user, notice: 'bucket deleted!' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bucket
      @bucket = Bucket.find(params[:id])
    end

    def set_user
      @user = current_user
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_params
      params.require(:bucket).permit(:name)
    end

    def correct_user
      @bucket = current_user.buckets.find_by(id: params[:id])
      redirect_to buckets_path, notice: "Not authorized to edit pin" if @bucket.nil?
    end
end
