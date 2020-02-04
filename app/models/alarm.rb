class Alarm < ApplicationRecord
  require 'date'

  def convert_time_to_date(timestamp)
    return nil if !timestamp.present?
    time = Time.strptime(timestamp.to_s,'%Q').to_f
    DateTime.strptime(time.to_s,'%s')
  end

  def self.get_and_set_alarm_in_db
    response  = HTTParty.get("https://sandboxsdwan.cisco.com:8443/dataservice/alarms", :verify => false, :basic_auth => {:username => "devnetuser", :password => "Cisco123!"})
    response["data"].each do |data|
      alarm =  Alarm.find_or_initialize_by(uuid: data["uuid"])
      alarm.alarm_id = data["id"]
      alarm.values = data["values"]
      alarm.values_short_display = data["values_short_display"]
      alarm.message = data["message"]
      alarm.rule_name_display =  data["rule_name_display"]
      alarm.severity = data["severity"]
      alarm.severity_number = data["severity_number"]
      alarm.entry_time =  alarm.convert_time_to_date(data["entry_time"]) 
      alarm.devices = data["devices"]
      alarm.active = data["active"]
      alarm.possible_causes = data["possible_causes"]
      alarm.tenant  = data["tenant"]
      alarm.acknowledged = data["acknowledged"]
      alarm.consumed_events = data["consumed_events"]
      alarm.statcycletime = alarm.convert_time_to_date(data["statcycletime"])
      alarm.receive_time = alarm.convert_time_to_date(data["receive_time"]) 
      alarm.rulename = data["rulename"]
      alarm.alarm_type = data["type"]
      alarm.eventname = data["eventname"]
      alarm.cleared_time = alarm.convert_time_to_date(data["cleared_time"])
      alarm.save
    end 
  end
    
end
