class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.string :focus_area
      t.integer :user_id
      t.timestamps null: false
    end
  end
end
