module RollerSnakes
  def run
    @current_price = @browser.first('.regular-price .price').text.gsub(/£/,"")

    @sizes = [0.0]
  end

end
