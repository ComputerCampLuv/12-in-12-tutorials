class Movie < ApplicationRecord
  searchkick
  belongs_to :user
  has_many :reviews
  has_one_attached :image
  validates :title, :desription, :runtime, :director, :rating, presence: true
  validate :image_type


  def thumbnail
    self.image.variant(resize: '400x600!').processed
  end

  private
  def image_type
    if image.attached? == false
      errors.add(:image, " is missing!")
    elsif !image.content_type.in?(%('image/jpeg'))
      errors.add(:image, " must be in jpeg format")
    end
  end
end
