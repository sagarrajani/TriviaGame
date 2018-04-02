class RemoveCategoryIdFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :category_id, :bigint
  end
end
