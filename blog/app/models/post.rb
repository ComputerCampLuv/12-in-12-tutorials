class Post < ApplicationRecord

  has_many :comments, dependent: :destroy

  validates :title, :body, presence: true
  validates :title, length: { minimum: 5 }
  
end
