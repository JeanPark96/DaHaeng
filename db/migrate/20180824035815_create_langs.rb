class CreateLangs < ActiveRecord::Migration
  def change
    create_table :langs do |t|
      t.string :country
      t.integer :score
      t.integer :visit

      t.timestamps null: false
    end
  end
end
