  class StaticPageScraper

    attr_accessor :price, :sizes

    def initialize(url)
        begin

        agent = Mechanize.new { |agent|
          agent.user_agent_alias = 'Mac Safari'
        }

        @page = agent.get(url)

        rescue
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
