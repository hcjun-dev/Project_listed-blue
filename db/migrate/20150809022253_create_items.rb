class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :category
      t.string :title
      t.text :description
      t.decimal :price
      t.datetime :post_date
      t.string :contact
      t.string :user
      t.string :user_id
      # Add fields that let Rails automatically keep track
      # of when items are added or modified:
      t.timestamps
    end
  end
end
