class SneakersController < ApplicationController
  # before_action :admin?
  before_action :set_sneaker, only: [:show, :edit, :update, :destroy]




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

    respond_to do |format|
      if @sneaker.save
         Sneaker.reindex
        format.html { redirect_to @sneaker, notice: 'Pin was successfully created.' }
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
         Sneaker.reindex
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
      format.html { redirect_to sneaker_url, notice: 'Pin was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sneaker
      @sneaker = Sneaker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sneaker_params
      params.require(:sneaker).permit(:name, :style_code, :brand, :color, :gender, :photo, :photo_cache, :alt_photo, :alt_photo_cache)
    end

    # def admin?
    #   unless current_user.admin == true
    #   redirect_to root, notice: "Not authorized"
    #   end
    # end
end
