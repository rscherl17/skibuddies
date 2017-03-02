class AddCommentCountToTrails < ActiveRecord::Migration[5.0]
  def change
    add_column :trails, :comments_count, :integer
  end
end
