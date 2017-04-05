class CreateTodoListsUsers < ActiveRecord::Migration
  def change
    # id: false means todo_lists_users table doesn't have a
    # primary key since this is just a join table.
    create_table :todo_lists_users, id:false do |t|
      t.references :user, index: true, foreign_key: true
      t.references :todo_list, index: true, foreign_key: true
    end
  end
end
