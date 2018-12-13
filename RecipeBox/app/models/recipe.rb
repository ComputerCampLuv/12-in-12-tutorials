class Recipe < ApplicationRecord
  has_one_attached :image
  has_many :ingredients
  has_many :directions
  belongs_to :user

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :directions, reject_if: :all_blank, allow_destroy: true
  # accepts_nested_attributes_for :ingredients,
  #                               reject_if: proc { |attributes| attributes['name'].blank? },
  #                               allow_destroy: true
  # accepts_nested_attributes_for :directions,
  #                               reject_if: proc { |attributes| attributes['step'].blank? },
  #                               allow_destroy: true

  validates :title, :description, :image, presence: true

end