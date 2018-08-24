class CreateTogethers < ActiveRecord::Migration
  def change
    create_table :togethers do |t|
      t.string :title2
      t.datetime :date2
      t.string :content2
      t.timestamps null: false
    end
  end
end
