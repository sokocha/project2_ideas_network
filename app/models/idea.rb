class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  acts_as_votable

  validates :title, presence: true
  validates :title, length: {in: 5..140}
  validates :title, uniqueness: true

  validates :description, presence: true
  validates :description, length: {maximum: 750}
  validates :main_image, presence: true
  validates :video_link, presence: true
  validates :category_id, presence: true


end
