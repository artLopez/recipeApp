class UpdatedLikeStatusFrom < ActiveRecord::Migration
  def change
  	remove_column :likes, :like, :boolean
  	add_column :likes, :liked, :boolean
  end
end
