class CreateSafetyapis < ActiveRecord::Migration
  def change
    create_table :safetyapis do |t|
      t.string :countryEnName
      t.integer :val
      t.timestamps null: false
    end
  end
end
