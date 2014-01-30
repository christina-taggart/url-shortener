class AddUrls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :address
      t.integer :count
      t.timestamps
    end
  end
end
