class SneakersController < ApplicationController
  before_action :admin?, only: [:admin, :new, :edit, :create, :update, :destroy, :admin_show]
  before_action :set_sneaker, only: [:show, :edit, :update, :destroy, :admin_show, :sneaker_update]




  def index
    search = params[:search].present? ? params[:search] : nil
    @sneakers = if search
      if search.strip.match(/\s/)
        Sneaker.search search, fields: [{style_code: :exact}, {name: :word_start}], operator: "or", misspellings: {below: 1}, page: params[:page], per_page: 24
      else
        Sneaker.search(search, misspellings: {below: 1}, fields: [{style_code: :exact}, {name: :word_start}], page: params[:page], per_page: 24)
      end
    else
      Sneaker.search "*", page: params[:page], per_page: 24
    end


  end


  def show

  end




  def new
    @sneaker = Sneaker.new
  end


  def edit
  end


  def create
    @sneaker = Sneaker.new(sneaker_params)



    @sneaker.sneak_brand = Brand.find(sneaker_params[:brand_id]).name.to_s

    respond_to do |format|
      if @sneaker.save

        format.html { redirect_to sneakers_admin_show_path(@sneaker), notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @sneaker }
      else
        format.html { render :new }
        format.json { render json: @sneaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pins/1
  # PATCH/PUT /pins/1.json
  def update
    respond_to do |format|
      if @sneaker.update(sneaker_params)

        format.html { redirect_to @sneaker, notice: 'Sneaker was successfully updated.' }
        format.json { render :show, status: :ok, location: @sneaker }
      else
        format.html { render :edit }
        format.json { render json: @sneaker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pins/1
  # DELETE /pins/1.json
  def destroy
    @sneaker.destroy
     Sneaker.reindex
    respond_to do |format|
      format.html { redirect_to sneakers_admin_index_path, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def admin

    @bucket = Bucket.new
    @bucket.pins.build

      @search = params[:search].present? ? params[:search] : nil
      @conditions = {}
      @conditions[:sneak_brand] = params[:brand].split(',').reject(&:empty?) if params[:brand].present?
      @conditions[:gender] = params[:gender] if params[:gender].present?

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

  def admin_show
    @users = @sneaker.pins.map {|p| User.find(p.user_id) }.uniq

  end

  def sneaker_update
      SpiderWorker.perform_async(@sneaker.id)
      respond_to do |format|
        format.html {redirect_to sneakers_admin_show_path(@sneaker)}
      end
  end

  def sneaker_update_all
    Sneaker.all.each do |sneaker|
      SpiderWorker.perform_async(sneaker.id)
    end
      respond_to do |format|
        format.html {redirect_to sneakers_admin_index_path}
      end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sneaker
      @sneaker = Sneaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sneaker_params
      params.require(:sneaker).permit(:name, :style_code, :brand_id, :color, :gender, :photo, :photo_cache, :alt_photo, :alt_photo_cache)
    end

    def admin?
      unless current_user.admin == true
      redirect_to root_path, alert: "Not authorized"
      end
    end
end
