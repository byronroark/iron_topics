class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :focus_area, presence: true
  validates :description, presence: true
  has_many :interests
  belongs_to :user

  def self.search(search)
    where("title like ? or focus_area like ?", "%#{search}%", "%#{search}%")
  end
end
