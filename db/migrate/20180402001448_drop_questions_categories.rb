class DropQuestionsCategories < ActiveRecord::Migration[5.1]
  def change
    drop_table :questions_categories
  end
end
