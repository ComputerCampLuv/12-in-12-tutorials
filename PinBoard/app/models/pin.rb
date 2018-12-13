class Pin < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_one_attached :image

  validates :title, :description, presence: true
end
