class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :title
      t.string :description
      t.string :focus_area
      t.integer :created_by
      t.integer :interest_count
      t.integer :interest_score
      t.timestamps null: false
    end
  end
end
