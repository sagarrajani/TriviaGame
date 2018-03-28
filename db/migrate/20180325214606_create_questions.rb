class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :category_id
      t.integer :unique_id
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
