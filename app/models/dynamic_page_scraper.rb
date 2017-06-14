class DynamicPageScraper

  require 'capybara/poltergeist'

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


        Capybara.current_session.driver.headers = { 'User-Agent' =>
          "Mozilla/5.0 (Macintosh; Intel Mac OS X)" }

    @browser = Capybara.current_session
    @browser.visit url
    sleep 5

  end


end
