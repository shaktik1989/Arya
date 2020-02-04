class AddColumnToAlarms < ActiveRecord::Migration[5.2]
  def change
    add_column :alarms, :values, :text, array: true, default: []
    add_column :alarms, :values_short_display, :text, array: true, default: []
    add_column :alarms, :message, :string
    add_column :alarms, :rule_name_display, :string
    add_column :alarms, :severity, :string
    add_column :alarms, :severity_number, :string
    add_column :alarms, :entry_time, :datetime 
    add_column :alarms, :uuid, :string
    add_column :alarms, :devices, :text, array: true, default: []
    add_column :alarms, :active, :boolean, default: :false
    add_column :alarms, :possible_causes, :string, array: true, default: []
    add_column :alarms, :tenant, :string
    add_column :alarms, :alarm_id, :string
    add_column :alarms, :acknowledged, :boolean , default: :false
    add_column :alarms, :consumed_events, :text, array: true, default: []
    add_column :alarms, :statcycletime, :datetime
    add_column :alarms, :receive_time, :datetime
    add_column :alarms, :component, :string
    add_column :alarms, :rulename, :string
    add_column :alarms, :alarm_type, :string
    add_column :alarms, :eventname, :string
    add_column :alarms, :cleared_time, :datetime
  end  
end
