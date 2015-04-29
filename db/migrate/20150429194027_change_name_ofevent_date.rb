class ChangeNameOfeventDate < ActiveRecord::Migration
  def change
  	rename_column :events, :eventDate, :event_date
  	rename_column :events , :startTime, :start_time
  end
end
