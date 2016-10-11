class AddForeignKeyToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :creator, index: true, foreign_key: true
  end
end