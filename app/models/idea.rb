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

  self.per_page = 1

  validate :title_not_changed



   private

   def title_not_changed
     if title_changed? && self.persisted? 
       errors.add(:title, "Change of title not allowed!")
     end
   end

end
