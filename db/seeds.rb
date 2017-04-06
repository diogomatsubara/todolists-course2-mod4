# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.destroy_all
Profile.destroy_all
TodoList.destroy_all
TodoItem.destroy_all

users = [
  { first_name: "Carly", last_name: "Fiorina", birth_year: 1954, gender: "female" },
  { first_name: "Donald", last_name: "Trump", birth_year: 1946, gender: "male" },
  { first_name: "Ben", last_name: "Carson", birth_year: 1951, gender: "male" },
  { first_name: "Hillary", last_name: "Clinton", birth_year: 1947, gender: "female" }
]

def generate_todo_items(todo_list_id, quantity)
  (1..quantity).each do |i|
    TodoItem.create! ({
      due_date: Date.today + 1.year,
      title: "some random title",
      description: "some random description",
      todo_list_id: todo_list_id
    })
  end
end

users.each do |user|
  Profile.create! user
  username = user[:last_name]
  u = User.create! ({ username: username, password_digest: "xxx" })
  todo_list = TodoList.create! ({
    list_name: user[:first_name] + "'s Todo List",
    list_due_date: Date.today + 1.year,
    user_id: u.id
  })
  generate_todo_items(todo_list.id, 5)
end
