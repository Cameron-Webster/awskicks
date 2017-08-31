module Schuh
  def run
    @current_price = @page.at('span#price').text.to_f
    @sizes = @page.search('select#sizes .sizeAvailable').map{|x| "#{x.attr('data-dispsize').gsub(/[^0-9]/,'').to_i}"}
  end
end
