class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :category
      t.string :title
      t.text :description
      t.decimal :price
      t.datetime :post_date
      # Add fields that let Rails automatically keep track
      # of when items are added or modified:
      t.timestamps
    end
  end
end
