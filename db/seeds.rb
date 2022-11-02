# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

categories = Category.create!([{ title: 'Frontend' }, { title: 'Backend' }, { title: 'Other' }])

users = User.create!([{ name: 'User1', email: 'user1@email.com' }, { name: 'User2', email: 'user2@email.com' },
                      { name: 'User3', email: 'user3@email.com' }])

tests = Test.create!(
  [{ title: 'HTML', level: 1, category: categories[0], author: users[0] },
   { title: 'Ruby', level: 3, category: categories[1], author: users[1] },
   { title: 'Python', level: 0, category: categories[1], author: users[1] },
   { title: 'JS', level: 2, category: categories[0], author: users[0] },
   { title: 'Git', level: 4, category: categories[2], author: users[2] },
   { title: 'RoR', level: 5, category: categories[2], author: users[2] }]
)

questions = Question.create!(
  [{ title: 'HTML - это ', test: tests[0] },
   { title: 'Cоздатель Ruby', test: tests[1] },
   { title: 'Python - это ', test: tests[2] },
   {
     title: 'Ключевое слово «new» используется в функциях-конструкторах для создания нового объекта (нового экземпляра класса)', test: tests[3]
   },
   { title: 'Команда в Git для инициилизации репозитория', test: tests[4] },
   { title: 'Паттерн,описывающий систему ORM в Rails', test: tests[5] }]
)

answers = Answer.create!(
  [{ correct: true, title: 'Это язык разметки', question: questions[0] },
   { correct: false, title: 'Это язык программирования', question: questions[0] },
   { correct: false, title: 'Это название Базы Данных', question: questions[0] },
   { correct: true, title: 'Юкихиро Мацумото', question: questions[1] },
   { correct: false, title: 'Гвидо ван Россум',  question: questions[1] },
   { correct: false, title: 'Бьёрн Страуструп',  question: questions[1] },
   { correct: true,
     title: 'высокоуровневый язык программирования с динамической строгой типизацией и автоматическим управлением памятью', question: questions[2] },
   { correct: false, title: 'компилируемый статически типизированный язык программирования', question: questions[2] },
   { correct: false, title: 'мультипарадигменный язык программирования', question: questions[2] },
   { correct: true, title: 'git init', question: questions[3] },
   { correct: false, title: 'git add', question: questions[3] },
   { correct: false, title: 'git commit', question: questions[3] },
   { correct: true, title: 'Нет', question: questions[4] },
   { correct: false, title: 'Да', question: questions[4] },
   { correct: true, title: 'Active Record', question: questions[5] },
   { correct: false, title: 'Action Controller', question: questions[5] },
   { correct: false, title: 'Action View', question: questions[5] }]
)
