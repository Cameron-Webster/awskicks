class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
      @search = params[:search].present? ? params[:search] : nil
      conditions = {}
      conditions[:brand] = params[:brand] if params[:brand].present?
      conditions[:gender] = params[:gender] if params[:gender].present?
      conditions[:lowest_price] = params[:lowest_price] if params[:lowest_price].present?
      @sneakers = if @search
      if @search.strip.match(/\s/)
        Sneaker.search @search, where: conditions, fields: [{style_code: :exact}, {name: :word_start}], operator: "or", misspellings: {below: 1}, per_page: 24, aggs: [:brand, :gender, :lowest_price]
      else
        Sneaker.search(@search, where: conditions, misspellings: {below: 1}, fields: [{style_code: :exact}, {name: :word_start}], per_page: 24, aggs: [:brand, :gender, :lowest_price])
      end
    else
      Sneaker.search "*", where: conditions, per_page: 12, aggs: [:brand, :gender, :lowest_price]
    end

  end
end
