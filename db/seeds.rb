# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{title: "Frontend"}, {title: "Backend"}, {title: "Other"}])

users = User.create!([{name: "User1", email: "user1@email.com"}, {name: "User2", email: "user2@email.com"}, {name: "User3", email: "user3@email.com"}]) 

tests = Test.create!(
  [{title: "HTML", level: 1, category: categories[0], author: users[0]},
  {title: "Rails", level: 3, category: categories[1], author: users[1]}, 
  {title: "Python", level: 3, category: categories[1], author: users[1]}, 
  {title: "JS", level: 2, category: categories[0], author: users[0]},
  {title: "Git", level: 4, category: categories[2], author: users[2]},
  {title: "Vim", level: 5, category: categories[2], author: users[2]}]) 

questions = Question.create!(
  [{title: "HTML это язык программирования", test: tests[0]}, 
  {title: "Active Record является реализацией ORM в Rails", test: tests[1]},
  {title: "Декоратор Python — это некоторое обновление синтаксиса Python, сделанное для более простого изменения функций", test: tests[2]},
  {title: "git add это команда для удаления untracked файлов", test: tests[4]},
  {title: "Vim - это текстовый редактор", test: tests[5]},
  {title: "Ключевое слово «new» используется в функциях-конструкторах для создания нового объекта (нового экземпляра класса)", test: tests[3]}]) 
    
answers = Answer.create!(
  [{correct: true, title: "Нет",  question: questions[0]},
  {correct: false, title: "Да",  question: questions[0]},  
  {correct: true, title: "Да",  question: questions[1]}, 
  {correct: false, title: "Нет",  question: questions[1]},
  {correct: true, title: "Да", question: questions[2]},
  {correct: false, title: "Нет", question: questions[2]},
  {correct: true, title: "Да", question: questions[3]},
  {correct: false, title: "Нет", question: questions[3]},
  {correct: true, title: "Нет", question: questions[4]},
  {correct: false, title: "Да", question: questions[4]},
  {correct: true, title: "Да", question: questions[5]},
  {correct: false, title: "Нет", question: questions[5]}])

results = Result.create!(
  [{user: users[0], test: tests[5]},
   {user: users[1], test: tests[3]},
   {user: users[2], test: tests[2]},
   {user: users[0], test: tests[4]},
   {user: users[1], test: tests[0]},
   {user: users[2], test: tests[2]},
   {user: users[0], test: tests[3]},
   {user: users[1], test: tests[2]},
   {user: users[2], test: tests[1]}])
