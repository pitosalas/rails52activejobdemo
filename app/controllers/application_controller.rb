class ApplicationController < ActionController::Base
    before_action :monitor_counterjob
    
    private
        
    def monitor_counterjob
        CounterJob.monitor
    end

end
