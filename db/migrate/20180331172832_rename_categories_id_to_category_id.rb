class RenameCategoriesIdToCategoryId < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions_categories, :categories_id, :category_id
  end
end
