class RemoveBooksIdFromFavorites < ActiveRecord::Migration[5.2]
  def change
    remove_column :favorites, :books_id, :integer
  end
end
