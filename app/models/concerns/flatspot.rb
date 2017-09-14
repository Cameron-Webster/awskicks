module Flatspot
    def run
        @current_price = @page.at('.product-price .money').text.gsub(/[^0-9\.]/,'').to_f
        puts "current price is #{@current_price}"
        @sizes = @page.search("#product-variants select option").map{|size| size.text.gsub(/[^0-9\.]/,'').to_f}
        puts "sizes are #{@sizes}"
        @sizes = @sizes.reject{|sz| sz == 0.0}
    end
end
