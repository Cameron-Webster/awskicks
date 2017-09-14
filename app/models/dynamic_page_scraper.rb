class DynamicPageScraper

  require 'capybara/poltergeist'

  attr_accessor :sizes, :current_price

  def initialize(url)

      ip_address = Vendor::IP_ADDRESSES.sample

      SpiderLog.info "Running Dynamic Spider Worker for #{url}"

      SpiderLog.info "ip address: #{ip_address[0]}  | user agent: #{ip_address[1]}"

      Capybara.register_driver :poltergeist do |app|


      Capybara::Poltergeist::Driver.new(app, phantomjs_options: ['--load-images=no', "--proxy=" + ip_address[0] + ":3128"], js_errors: false)
      end

    Capybara.default_driver = :poltergeist

     # @session = Capybara::Session.new(:poltergeist)


        Capybara.current_session.driver.headers = { 'User-Agent' =>
          ip_address[1] }

    @browser = Capybara.current_session
    @browser.visit url
    sleep(rand(5..7))

    @browser.driver.scroll_to(0, 500)

  end


end
