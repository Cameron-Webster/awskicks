module Schuh
  def run
    @current_price = @page.at('span#price').text
    @sizes = @page.search('select#sizes .sizeAvailable').map{|x| ["UK", "#{x.attr('data-dispsize').gsub(/[^0-9]/,'').to_i}"]}
  end
end
