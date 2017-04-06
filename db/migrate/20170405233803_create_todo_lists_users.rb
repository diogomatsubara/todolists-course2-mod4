class CreateTodoListsUsers < ActiveRecord::Migration
  def change
    change_table(:todo_lists) do |t|
     t.references :user
    end
  end
end
