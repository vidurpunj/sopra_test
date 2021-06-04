class CreateTvSeriels < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_seriels do |t|
      t.string :name
      t.string :genre
      t.integer :seasons
      t.date :release_date
      t.string :director
      t.string :actor
      t.string :shoot_location
      t.string :country

      t.timestamps
    end
  end
end
