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

  # This function is used in the ideas views. It calculates the overall originality score, given the vote scope of 'rate_originality', by taking an average across all such votes. The "else" is necessary because without it, when an idea doesn't have ratings, this method would end up dividing by zero, and no one likes dividing by zero.
  def current_originality_rating
    if self.get_upvotes(:vote_scope => 'rate_originality').size > 0
      self.get_likes(:vote_scope => 'rate_originality').sum(:vote_weight) / self.get_upvotes(:vote_scope => 'rate_originality').size
    else
      "no ratings yet"
    end
  end


   private

   def title_not_changed
     if title_changed? && self.persisted? 
       errors.add(:title, "Change of title not allowed!")
     end
   end

end
