class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|     
      t.integer  :score
      t.integer :country_id
      t.string :title
      t.string :content
      t.datetime :date
      t.string :author
      t.timestamps null: false
    end
  end
end
