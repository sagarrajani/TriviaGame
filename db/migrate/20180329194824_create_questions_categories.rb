class CreateQuestionsCategories < ActiveRecord::Migration[5.1]
  def change
    create_table :questions_categories do |t|
      t.references :questions, foreign_key: true
      t.references :categories, foreign_key: true

      t.timestamps
    end
  end
end
