class RemoveDueDateFromTasks < ActiveRecord::Migration[7.1]
  def change
    remove_column :tasks, :duedate, :date
  end
end
