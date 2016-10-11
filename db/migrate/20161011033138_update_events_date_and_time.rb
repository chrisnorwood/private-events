class UpdateEventsDateAndTime < ActiveRecord::Migration[5.0]
  def change
    change_column :events, :date, :datetime
    rename_column :events, :date, :time
    remove_column :events, :start_time
  end
end
