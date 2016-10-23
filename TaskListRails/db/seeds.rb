# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tasks = [
  {
    task_name: "Buy Paper goods",
    description: "toilet paper, paper towels, foil, tissue",
  },
  {
    task_name: "Clean Kitchen",
    description: "dishes, mop, and run dishwasher",
  },
  {
    task_name: "Look at Cart Stuff for bEsty",
    description: "It is a mystery why I cannot delete items",
  },
  {
    task_name: "Call father",
    description: "recap WestWorld",
  },
  {
    task_name: "Catch up on WestWorld",
    description: "still on episode one. I think I am 2 behind",
  },
  {
    task_name: "Wash Linen",
    description: "This can be done with other stuff",
  },
  {
    task_name: "Practice Practice Practice",
    description: "apparently it makes perfect",
  }
]

tasks.each do |task|
  Task.create(task)
end
