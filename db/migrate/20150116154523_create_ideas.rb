class CreateIdeas < ActiveRecord::Migration
  def change
    create_table :ideas do |t|
      t.string :title
      t.text :description
      t.string :feedback_type
      t.string :main_image
      t.string :video_link 
      t.integer :category_id
      t.string :status
      t.integer :user_id

      t.timestamps
    end
  end
end
