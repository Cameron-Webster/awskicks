require 'active_support/concern'

module Asos
    def run
    price_raw = @browser.first "span[data-id='current-price']"
    @current_price = price_raw.text.gsub(/£/,"").to_f
    available_sizes = @browser.all "#aside-content select[data-id='sizeSelect'] option:not(:disabled)"
    @sizes = available_sizes.each_with_index.map do |size, i|
      next if i == 0
      size.text.split(" - ").map{|ob| ob.split(" ")}
    end

    # get uk only sizes
    @sizes = @sizes.drop(1).map{|arr| arr[0][1].to_f}

  end

  def multiplyer_eu(size, gender)
    # size = size.to_f
    if gender == "men"
      if size <= 5.5
        return size + 33.0
      elsif size == 6.0 || 6.5 || 7.0
        return size + 34.0
      elsif size == 7.5
        return 42.0
      elsif size == 8.0
        return 42.5
      elsif size == 8.5
        return 43.0
      elsif size == 9.0 || 9.5 || 10.0 || 11.0
        return size + 35.0
      else
        return size + 35.5
      end
    else
      return size + 33.0
    end
  end

  def multiplyer_us(size, gender)
    # size = size.to_f
    if gender == 'men'
      if size > 5.5
        size + 1.0
      else
        size + 0.5
      end
    else
      size + 2.0
    end
end
end
