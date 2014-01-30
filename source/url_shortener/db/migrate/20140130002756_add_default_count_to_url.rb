class AddDefaultCountToUrl < ActiveRecord::Migration
  def up
    #add a DEFAULT value
    execute <<-SQL
      ALTER TABLE urls
       ALTER COLUMN count
        SET DEFAULT 0
    SQL
  end

  def down
	  execute <<-SQL
	    ALTER TABLE urls
	      DROP DEFAULT count
	  SQL
  end
end
