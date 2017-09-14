module Jdsports
  def run


    @browser.driver.scroll_to(0, 500)


    @current_price = @browser.first('.itemPrices .pri')&.text

    if @current_price.nil?
      @browser.save_screenshot('jdsportsimg-6.png')
      @current_price = @browser.all('.pri span')
      @current_price.each do |cp|
          puts "price spans #{cp.text}"
      end
      @current_price = @current_price.gsub(/[^0-9\.]/,'').to_f unless @current_price.empty?
    else
      @current_price = @current_price.gsub(/[^0-9\.]/,'').to_f
    end
    puts "current price JD Float #{@current_price}"


    sizes = @browser.all(" #itemOptions .options button").reject {|sz| sz['disabled']}

    sizes.each do |sz|
      puts sz.text
       puts sz['disabled']
    end

    @sizes = sizes.map{|size| size.text.to_f}

    puts "sizes JD are: #{@sizes}"

  end

end
