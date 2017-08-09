class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :show_modal ]

  def home
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

  def show_modal
     @sneak = Sneaker.find(params[:sneaker_id]) || ""
      if current_user
       @existing_buckets = current_user.pins.where("sneaker_id = ?", @sneak.id).map{|p|p.bucket}.uniq
       @buckets = current_user.buckets - @existing_buckets
       @buckets_cut = @buckets.each_slice(8).to_a
      end


  end



end

