class BucketsController < ApplicationController
  before_action :set_bucket, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]
   before_action :set_user, only: [:create, :destroy, :update]

  # GET /pins
  # GET /pins.json
  def index
    @buckets = current_user.buckets.all
  end

  # GET /pins/1
  # GET /pins/1.json
  def show


       sneak_ids = @bucket.pins.map(&:sneaker_id)

      @search = params[:search].present? ? params[:search] : nil
      @conditions = {}
      @conditions[:sneak_brand] = params[:brand].split(',').reject(&:empty?) if params[:brand].present?
      @conditions[:gender] = params[:gender] if params[:gender].present?
      @conditions[:id] = sneak_ids

       if params[:order].present?
         order_params = params[:order].split(" ")
          @order =  {order_params[0].to_sym => order_params[1].to_sym}
        else
            @order = {_score: :desc}
        end

      if params[:lowest_price].present?
        range = params[:lowest_price].split("-")
        @conditions[:lowest_price] = {gte: range[0], lte: range[1]}
      end

        @sneakers = if @search
      if @search.strip.match(/\s/)
        Sneaker.search @search, where: @conditions, order: @order, fields: [{style_code: :exact}, {name: :word_start}], operator: "or", misspellings: {below: 1}, page: params[:page], per_page: 24, aggs: [:sneak_brand, :gender]
      else
        Sneaker.search(@search, where: @conditions, order: @order, misspellings: {below: 1}, fields: [{style_code: :exact}, {name: :word_start}], page: params[:page], per_page: 24, aggs: [:sneak_brand, :gender])
      end
    else
      Sneaker.search "*", where: @conditions, order: @order, page: params[:page], per_page: 24, aggs: [:gender, :sneak_brand]
    end

  end

  # GET /pins/new
  def new
    @bucket = Bucket.new
    @bucket.pins.build
    @sneaker = params[:sneaker_id]
     respond_to do |format|
        format.html
        format.js
    end

  end

    def newempty
    @bucket = Bucket.new

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
    @bucket = current_user.buckets.new(bucket_params)
    if bucket_params[:pins_attributes]
    @bucket.pins.first.user_id = current_user.id
    end
    respond_to do |format|
      if @bucket.save
        format.js
        format.html { redirect_to buckets_path, notice: "bucket created #{@bucket.pins.count}- time to add some kicks"}
      else
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
        format.html { redirect_to buckets_path, alert: "Unable to create Bucket. Name required" }
      end
    end
    # end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @bucket.update(bucket_params)
        format.html { redirect_to buckets_path, notice: 'Bucket was successfully updated.' }
        format.json { render :show, status: :ok, location: @pin }
      else
        format.html { render :edit, status: :unprocessable_entity}
        format.json { render json: @bucket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @bucket.destroy
    respond_to do |format|
      format.html { redirect_to buckets_path, notice: 'bucket deleted!' }
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

    def pin_params
      params.require(:pin).permit(:sneaker_id, :price_watch)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bucket_params
      params.require(:bucket).permit(:name, pins_attributes: [:id, :sneaker_id, :price_watch])
    end

    def correct_user
      @bucket = current_user.buckets.find_by(id: params[:id])
      redirect_to buckets_path, notice: "Not authorized to edit pin" if @bucket.nil?
    end
end
