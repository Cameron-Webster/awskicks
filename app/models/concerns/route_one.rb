# static
module RouteOne
    def run
      @current_price = @page.at('.blu-price span').text.gsub(/[^0-9\.]/,'')
      @sizes = @page.search(".product-options label").map{|size| size.text.gsub(/[^0-9\.]/,'').to_f}

      @sizes = @sizes.reject{|sz| sz == 0}
  end
end
