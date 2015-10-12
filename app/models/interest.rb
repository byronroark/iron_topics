class Interest < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  belongs_to :user

  validates :score, inclusion: [1,2,3,4,5]
end
