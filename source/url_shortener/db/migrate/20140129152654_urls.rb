class Urls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string  :full
      t.string  :short
      t.integer :click_count
    end
  end
end
