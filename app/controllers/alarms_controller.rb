class AlarmsController < ApplicationController
  before_action :fetch, only: [:index] 

  def index 
    @alarms = Alarm.paginate(page: params[:page],per_page: 10)
  end  

  private

    def fetch
      return  unless params[:fetch].eql?('true')
      Alarm.get_and_set_alarm_in_db 
      redirect_to alarms_path  
    end
end

