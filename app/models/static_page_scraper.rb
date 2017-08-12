  class StaticPageScraper

    attr_accessor :current_price, :sizes

    def initialize(url)
      @retries = 0
        begin

        agent = Mechanize.new { |agent|
          agent.user_agent_alias = 'Mac Safari'
          agent.set_proxy("45.32.231.36", "31280", "railscam", "railscamproxy90")
        }

        @page = agent.get(url)

        rescue
          @retries += 1
          if retries < 4
              agent.shutdown
              agent = Mechanize.new { |agent|
                agent.user_agent_alias = 'Windows Chrome'
              }
              agent.request_headers
              sleep(2)
              @page = agent.get(url)
          end
        end
    end


  end
