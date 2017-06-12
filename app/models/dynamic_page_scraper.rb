class DynamicPageScraper

  attr_accessor :sizes, :current_price

  def initialize(url)

      Capybara.register_driver :poltergeist do |app|
      # stop images loading
        options = {
        phantomjs_options: ['--load-images=no']
       }

      Capybara::Poltergeist::Driver.new(app, js_errors: false)
      end

    Capybara.default_driver = :poltergeist

     # @session = Capybara::Session.new(:poltergeist)

        # Report using a particular user agent
        Capybara.current_session.driver.headers = { 'User-Agent' =>
          "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

      @browser = Capybara.current_session
    @browser.visit url
    sleep 5

  end

  def asos
    price_raw = @browser.first "span[data-id='current-price']"
    @current_price = price_raw.text.gsub(/£/,"").to_i
    available_sizes = browser.all "#aside-content select[data-id='sizeSelect'] option:not(:disabled)"
    @sizes = available_sizes.each_with_index.map do |size, i|
      next if i == 0
      size.text.split(" - ").map{|ob| ob.split(" ")}
    end
    @sizes = @sizes.drop(1)
  end

end
