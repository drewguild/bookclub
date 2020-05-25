# Bookclub

## About

My pass at making a bookclub management app for my own bookclub. A place for us to track book nominations, meetings, etc. A place to explore Rails patterns beyond MVC. Also interested in seeing how far I can go with just vanillajs and Jquery frontend.

## Live

See it [here](https://core-of-bookclub.herokuapp.com/)

## Roadmap
:heavy_check_mark: Basic user auth

:heavy_check_mark: Members can nominate books and details are autopopulated from external data source (e.g Google Books)

:heavy_check_mark: Members can upvote books they are interested in

:construction_worker: Clubs can set and change meeting dates

:x: Book nominations are associated to particular meetings

:x: Email updates to users

:x: etc.

## Running

- Clone
- `bundle install` to get dependencies
- `rake db:create` and `rake db:migrate` to build database
- `rails s` to run on port 3000 (`localhost:3000`)
