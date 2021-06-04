class CreateTvSeriels < ActiveRecord::Migration[6.0]
  def change
    create_table :tv_seriels do |t|
      t.string :name
      t.string :genre
      t.integer :seans_count
      t.date :releate_date
      t.string :director
      t.string :actor
      t.string :shoot_location
      t.string :country

      t.timestamps
    end
  end
end
