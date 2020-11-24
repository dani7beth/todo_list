class RenameListsToTasks < ActiveRecord::Migration[6.0]
  def change
    rename_column :lists, :task, :item
    rename_table :lists, :tasks
  end
end
