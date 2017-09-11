module Jdsports
  def run


    @browser.driver.scroll_to(0, 500)

    @current_price = @browser.first('.itemPrices .pri').text

    @sizes = @browser.all(" #itemOptions .options button").map{|size| size.text.to_f}


  end

end
