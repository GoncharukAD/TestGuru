# Проект TestGuru
### Учебный проект школы <a href="https://thinknetica.com" target="_blank">Thinknetica</a></h2>
---
**TestGuru** - приложение для создания, управления и выполнения различных тестов

## Description:
##### This application allows users to create and to pass tests. Main functionality includes:
* Users can manage tests with CRUD operations
* All signed in users can pass any test of any user unlimited number of times. When the user completes the test, he will also receive an email notification with the results of passing
* Tests authors can manage answers for their tests (CRUD operations + mark answers as correct)
* Users can create gists in their github profile on questions they are interested while passing the test
* There is an achievement system. Users can receive badges if they satisfied some rules (e.x. finish all hard level tests, finish test on first try and etc). Users can later view received badges in their profile. Badges can be received only once without duplication
* It is also possible to create tests with time limit and pass them with a timer
* Full english and russian localization

## Used technologies and gems:
*  Rails 6
*  Javascript & Jquery (timer for tests and progress bar for passing; sorting list of tests on root page)
*  Octokit (for creating gists)
*  Bootstrap
*  Pg (used PostgreSQL as the database for Active Record)
*  I18n for localization
*  Devise
*  Configured ActionMailer (sending test passage results to user's email )
