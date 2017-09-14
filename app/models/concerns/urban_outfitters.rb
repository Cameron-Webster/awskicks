module UrbanOutfitters
    def run

     @current_price = @page.at('span.c-product-meta__current-price')&.text.gsub(/£/,"").to_f

     all_sizes =  @page.search "select#fit-sizes option"

     sizes = all_sizes&.reject{|sz| sz.text.match(/Sold Out/i) }&.map do |x|

      x.text.split("/")[0].gsub(/[^0-9\.]/,'')

    end

    @sizes = sizes.reject(&:empty?)
    end
  end
