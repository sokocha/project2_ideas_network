class Idea < ActiveRecord::Base
  belongs_to :user
  belongs_to :category
  validates :title, presence: true
  validates :title, length: {in: 5..45}
  validates :title, uniqueness: true

  validates :description, presence: true
  validates :description, length: {maximum: 500}
  validates :main_image, presence: true
  validates :video_link, presence: true
  validates :category_id, presence: true


end
