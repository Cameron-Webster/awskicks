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

    def schuh
        @price = @page.at('span#price').text
        @sizes = @page.search('select#sizes .sizeAvailable').map{|x| x.attr('data-dispsize').gsub(/[^0-9]/,"").to_i}
    end


  end
