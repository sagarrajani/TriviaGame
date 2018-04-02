class RemoveUniqueIdFromQuestions < ActiveRecord::Migration[5.1]
  def change
    remove_column :questions, :unique_id, :integer
  end
end
