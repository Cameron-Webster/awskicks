module Footasylum
  def run
    @browser.driver.scroll_to(0, 500)
    @current_price = @browser.first('li#priceFrm').text



    puts "current price is #{@current_price}"

      @sizes = @browser.all("#uloption2 li span.sizevariant").map{|size| size.text.to_f}

      @sizes.each do |size|

        puts "size is #{size}"

      end

  end

end
