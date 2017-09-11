class DynamicPageScraper

  require 'capybara/poltergeist'

  attr_accessor :sizes, :current_price

  def initialize(url)



      Capybara.register_driver :poltergeist do |app|
      # stop images loading
       #  options = {
       #    js_errors: false
       # }

      Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--load-images=no', '--proxy=45.32.231.36:31280', '--proxy-auth=' + ENV["PROXY_DYNAMIC"]], js_errors: false, debug: true)
      end

    Capybara.default_driver = :poltergeist

     # @session = Capybara::Session.new(:poltergeist)


        Capybara.current_session.driver.headers = { 'User-Agent' =>
          "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

    @browser = Capybara.current_session
    @browser.visit url
    sleep 5

    @browser.driver.scroll_to(0, 500)

  end


end
