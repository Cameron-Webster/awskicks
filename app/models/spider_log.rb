class SpiderLog
  def self.info(message=nil)
    @spider_log ||= Logger.new("#{Rails.root}/log/spider_log.log")
    @spider_log.info(message) unless message.nil?
  end
end
