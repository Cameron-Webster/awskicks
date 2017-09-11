module Flatspot
    def run
        @current_price = @browser.first('.product-price .money.is-loaded').text.gsub(/[^0-9\.]/,'')
        @sizes = @browser.all("#product-variants select option").map{|size| size.text.gsub(/UK/,"")}
        @sizes = @sizes.reject{|sz| sz == 0.0}
    end
end
