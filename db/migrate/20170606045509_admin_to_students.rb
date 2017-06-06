class AdminToStudents < ActiveRecord::Migration
  def change
    add_column :students, :admin, :boolean, default: 0
  end
end
