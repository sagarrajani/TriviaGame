class AddUserToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :questions, :users, foreign_key: true
  end
end
