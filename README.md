# README

* How to Run Instructions

run from terminal:
```terminal
git clone git@github.com:The4star/nahimastay.git
```
```
cd nahimastay/
```
```
psql postgres
```
run from within postgres:
```
create role nahimastay with createdb login password '123456';
```
```
exit
```
run from within terminal:
```
rails db:create
```
```
rails s
```
you're in!


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
