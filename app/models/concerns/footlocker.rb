module Footlocker
  def run
    @current_price = @browser.first("span.fl-price--sale span").text.gsub(/£/,"").gsub(/,/, ".").to_f
    puts "current_price #{@current_price}"
    @browser.driver.scroll_to(0, 500)


     # all_sizes = @browser.all(".fl-product-size  button span").map {|sz| sz.text.gsub(/,/, ".").to_f}


     #  not_available_sizes = @browser.all(".fl-product-size  button.fl-product-size--item__not-available span").map {|sz| sz.text.gsub(/,/, ".").to_f}

     # @sizes = all_sizes - not_available_sizes

    @sizes = @browser.all(".fl-product-size  button:not(.fl-product-size--item__not-available) span").map {|sz| sz.text.gsub(/,/, ".").to_f}

  end

end
