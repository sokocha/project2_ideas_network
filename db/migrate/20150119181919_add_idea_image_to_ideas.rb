class AddIdeaImageToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :idea_image, :string
  end
end
