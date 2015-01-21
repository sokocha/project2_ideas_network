class AddVideoLinkHtmlToIdeas < ActiveRecord::Migration
  def change
    add_column :ideas, :video_link_html, :string
  end
end
