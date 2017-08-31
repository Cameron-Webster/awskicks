module Caliroots
    def run



     pw = @browser.all('div.form.c-4.last p')
      pw.each do |x|
          puts "paraas #{x}"
      end

    # price_raw = @browser.all('.form.c-4.last p span:not(.price-from)').text.to_f
    # @current_price = price_raw.text.gsub(/£/,"").to_f
    # puts "price raw #{price_raw}"


    # available_sizes = @browser.all ".add-to-cart-form ul.list.down option span.text"
    # @sizes = available_sizes.each_with_index.map do |size, i|
    #   next if i == 0
    #   size.text.split(" - ").map{|ob| ob.split(" ")}
    # end

    # get uk only sizes
    # @sizes = @sizes.drop(1).map{|arr| arr[0][1].to_f}
    end
  end
