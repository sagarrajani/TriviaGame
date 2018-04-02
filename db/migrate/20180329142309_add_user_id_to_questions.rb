class AddUserIdToQuestions < ActiveRecord::Migration[5.1]
  def change
    add_column :questions, :user_id, :integer
    add_reference :questions, :users, foreign_key: true
  end
end
