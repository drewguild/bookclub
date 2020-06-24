# Bookclub

## About

My pass at making a bookclub management app for my own bookclub. A place for us to track book nominations, meetings, etc. A place to explore Rails patterns beyond MVC. Also interested in seeing how far I can go with just vanillajs and Jquery frontend.

## Live

See it [here](https://core-of-bookclub.herokuapp.com/)

To see it in action, test username:password is `dsample:letmein`. (Since the app is mostly intended for my bookclub, I haven't prioritized club administration features)

## Roadmap
:heavy_check_mark: Basic user auth

:heavy_check_mark: Members can nominate books and details are autopopulated from external data source (e.g Google Books)

:heavy_check_mark: Members can upvote books they are interested in

:heavy_check_mark: Clubs can set and change meeting dates

:heavy_check_mark: Clubs can track previously read books + move nominations to read

:heavy_check_mark: Members can leave a review on each book

:construction_worker: Improve book data pulled from books.google

:x: Generated recommendations

:x: Email updates to users

:x: Google Calendar sync

:x: etc.

## Running

- Clone
- `bundle install` to get dependencies
- `rake db:create` and `rake db:migrate` to build database
- `rails s` to run on port 3000 (`localhost:3000`)
