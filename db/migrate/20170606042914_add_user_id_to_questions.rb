class AddUserIdToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :student_id, :integer
  end
end
