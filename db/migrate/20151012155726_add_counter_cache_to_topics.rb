class AddCounterCacheToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :interests_count, :integer
  end
end
