class Topic < ActiveRecord::Base
  validates :title, presence: true
  validates :focus_area, presence: true
  validates :description, presence: true
  has_many :interests
  belongs_to :user

  accepts_nested_attributes_for :interests

  def self.search(search)
    where("title like ? or focus_area like ?", "%#{search}%", "%#{search}%")
  end
end
