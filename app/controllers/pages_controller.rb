class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
      search = params[:search].present? ? params[:search] : nil
      @sneakers = if search
      if search.strip.match(/\s/)
        Sneaker.search search, fields: [{style_code: :exact}, {name: :word_start}], operator: "or", misspellings: {below: 1}, page: params[:page], per_page: 24
      else
        Sneaker.search(search, misspellings: {below: 1}, fields: [{style_code: :exact}, {name: :word_start}], page: params[:page], per_page: 24)
      end
    else
      Sneaker.search "*", page: params[:page], per_page: 12
    end

  end
end
