# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{title: "Frontend"}, {title: "Backend"}])

tests = Test.create!([{title: "HTML", level: 1, category: categories[0]},
  {title: "Rails", level: 3, category: categories[1]}, 
  {title: "Python", level: 3, category: categories[1]}, 
  {title: "JS", level: 2, category: categories[0]}]) 

questions = Question.create!([{title: "HTML is a programming language", test: tests[0]}, #HTML это язык программирования
    {title: "Active Record is an implementation of ORM in Rails", test: tests[1]}, #Active Record является реализацией ORM в Rails
    {title: "The Python Decorator is some update of Python syntax made for simpler function changes.", test: tests[2]},#Декоратор Python — это некоторое обновление синтаксиса Python, сделанное для более простого изменения функций
    {title: "The keyword 'new' is used in constructor functions to create a new object (a new instance of the class)", test: tests[3]}]) #Ключевое слово «new» используется в функциях-конструкторах для создания нового объекта (нового экземпляра класса)"
    
answers = Answer.create!([{correct: false, question: questions[0]},
  {correct: true, question: questions[1]},  
  {correct: true, question: questions[2]}, 
  {correct: true, question: questions[3]}])     
  
users = User.create!([{name: "User1"}, {name: "User2"}]) 

results = Result.create!([{user: users[0], test: tests[1]}, {user: users[1], test: tests[3]}, {user: users[0], test: tests[2]}])
