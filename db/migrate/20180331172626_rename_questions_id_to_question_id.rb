class RenameQuestionsIdToQuestionId < ActiveRecord::Migration[5.1]
  def change
    rename_column :questions_categories, :questions_id, :question_id
  end
end
