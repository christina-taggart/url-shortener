class Urls < ActiveRecord::Migration
  def change
    create_table :urls do |t|
      t.string :full
      t.string :short
    end
  end
end
