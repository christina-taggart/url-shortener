class CreateUrls < ActiveRecord::Migration
  def change
    create_table :urls do |col|
      col.string :long_url, :short_url
    end
  end
end
