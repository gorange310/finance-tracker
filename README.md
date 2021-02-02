# Finance-Tracker
This is a US stock tracker app\
I'm currently a Ruby/Rails app developer, this is my personal project when I was learn from Udemy Course: the-complete-ruby-on-rails-developer-course.


I followed RESTful conventions for my routes but since I was only utilizing certain functions, I added limitations to them.\
Users can only be showed.\
Stcoks can only be updated.\
It isn't full CRUD but enough to implement the user stories required. There’s also room to expand in the future to for the other CRUD features.


## 1 Development tools

* Ruby 2.6.6

* Rails 6.1.1

* PostgreSQL 9.3

* User system: gem 'devise'

* Layout: gem 'font-awesome-rails', gem 'devise-bootstrap-views'

* Ajax for form submission, in-depth

* Working with an external API (gem 'iex-ruby-client') to get stock information


## 2 Installation

* git clone https://github.com/gorange310/finance-tracker.git finance-tracker
* cd finance-tracker
* bundle
* rails db:migrate
* rails s


## 3 The Production Deployment server: Heroku

  http://orange-finance-tracker.herokuapp.com/
  
  
## 4 table schema
.![Untitled (1)](https://user-images.githubusercontent.com/44969245/106557888-cec03900-655d-11eb-9f42-60594fa029e2.png)
