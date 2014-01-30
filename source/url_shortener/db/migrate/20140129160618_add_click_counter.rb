class AddClickCounter < ActiveRecord::Migration
  def change
    change_table :urls do |col|
      col.integer :click_counter, default: 0
    end
  end
end
