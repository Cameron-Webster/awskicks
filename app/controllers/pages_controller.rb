class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @bucket = Bucket.new
    @bucket.pins.build
      # @url = request.fullpath
      # @url = @url.insert(1,"?") if @url[1] != "?"
      @search = params[:search].present? ? params[:search] : nil
      @conditions = {}
      @conditions[:brand] = params[:brand] if params[:brand].present?
      @conditions[:gender] = params[:gender] if params[:gender].present?
      # @conditions[:lowest_price] = params[:lowest_price] if params[:lowest_price].present?
      @sneakers = if @search
      if @search.strip.match(/\s/)
        Sneaker.search @search, where: @conditions, fields: [{style_code: :exact}, {name: :word_start}], operator: "or", misspellings: {below: 1}, page: params[:page], per_page: 24, aggs: [:brand, :gender]
      else
        Sneaker.search(@search, where: @conditions, misspellings: {below: 1}, fields: [{style_code: :exact}, {name: :word_start}], page: params[:page], per_page: 24, aggs: [:brand, :gender])
      end
    else
      Sneaker.search "*", where: @conditions, page: params[:page], per_page: 12, aggs: [:brand, :gender]
    end
  end

  def show_modal
     @sneak = Sneaker.find(params[:sneaker_id]) || "nooooo"
      @existing_buckets = current_user.pins.where("sneaker_id = ?", @sneak.id).map{|p|p.bucket}.uniq
     @buckets = current_user.buckets - @existing_buckets



  end



end

