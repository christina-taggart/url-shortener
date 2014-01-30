class CreateUrls < ActiveRecord::Migration
  def change
    create_table do |t|
      t.string :long_url, :short_url,
      t.integer :click_count
    end
  end
end
