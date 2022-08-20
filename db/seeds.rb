# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create([{title: "Frontend"}, {title: "Backend"}])

User.create([{name: "User1"}, {name: "User2"}]) 

Result.create([{user_id: 1, test_id: 2}, {user_id: 2, test_id: 4}, {user_id: 1, test_id: 3}]) #[{users[0], tests[1]}, {users[1], tests[3]}, {users[0], tests[2]}]

Question.create([
   {title: "HTML это язык программирования", test_id: 1}, #tests[0]
   {title: "Active Record является реализацией ORM в Rails", test_id: 2}, #tests[1]
   {title: "Декоратор Python — это некоторое обновление синтаксиса Python, сделанное для более простого изменения функций", test_id: 3}, #tests[2]
   {title: "Ключевое слово «new» используется в функциях-конструкторах для создания нового объекта (нового экземпляра класса)", test_id: 4}]) #tests[3]

Test.create([{title: "HTML", level: 1, category_id: 1}, #categories[0]
  {title: "Rails", level: 3, category_id: 2}, #categories[1]
  {title: "Python", level: 3, category_id: 2}, #categories[1]
  {title: "JS", level: 2, category_id: 1}]) #categories[0]
  
Answer.create([{correct: false, question_id: 1}, #questions[0] 
  {correct: true, question_id: 2},  #questions[1] 
  {correct: true, question_id: 3}, #questions[2] 
  {correct: true, question_id: 4}]) #questions[3] 