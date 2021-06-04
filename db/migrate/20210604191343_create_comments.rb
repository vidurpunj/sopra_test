class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.references :tv_seriel, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.integer :stars
      t.string :review

      t.timestamps
    end
  end
end
