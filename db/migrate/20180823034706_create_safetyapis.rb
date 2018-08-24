class CreateSafetyapis < ActiveRecord::Migration
  def change
    create_table :safetyapis do |t|
      t.string :items
      t.timestamps null: false
    end
  end
end
