class AddIndexToAttendances < ActiveRecord::Migration[5.0]
  def change
    add_index :attendances, [:user_id, :event_id]
  end
end
