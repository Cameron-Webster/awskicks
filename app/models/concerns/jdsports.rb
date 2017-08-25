module Jdsports
  def run

    @current_price = @page.at('.itemPrices .pri').text.gsub(/[^0-9\.]/,'')

    @sizes = @page.search(" #itemOptions .options button").map{|size| size.text.to_f}

  end

end
