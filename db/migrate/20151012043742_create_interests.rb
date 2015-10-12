class CreateInterests < ActiveRecord::Migration
  def change
    create_table :interests do |t|
      t.string :comment
      t.integer :score
      t.integer :created_by
      t.integer :topic_id
      t.timestamps null: false
    end
  end
end
