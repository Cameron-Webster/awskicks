

  class StaticPageScraper

    attr_accessor :current_price, :sizes

    def initialize(url)



      ip_address = Vendor::IP_ADDRESSES.sample
      SpiderLog.info "Running Static Spider Worker for #{url}"

      SpiderLog.info "ip address: #{ip_address[0]}  | user agent: Mac Safari"
      @retries = 0
        begin

        agent = Mechanize.new { |agent|
          agent.user_agent_alias = 'Mac Safari'
          agent.set_proxy(ip_address[0], "3128")
        }

        @page = agent.get(url)
        sleep(rand(3..5))

        rescue
          @retries += 1
          if @retries < 4
              agent.try(:shutdown)
              agent = Mechanize.new { |agent|
                agent.user_agent_alias = 'Windows Chrome'
                agent.user_agent_alias = ip_address[1]
              }
              agent.request_headers
              sleep(2)
              @page = agent.get(url)
          end
        end
    end


  end
