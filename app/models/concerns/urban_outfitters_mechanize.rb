module UrbanOutfittersMechanize
    def run
      @current_price = @page.at('span.c-product-meta__current-price').text.gsub(/£/,"").to_f

      @sizes = @page.search("select#fit-sizes option:not([disabled])").map{|size| size.text.split(" ").drop(1).map(&:to_f)}


      @sizes = @sizes.flatten
    end
end
