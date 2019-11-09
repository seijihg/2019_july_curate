## Curate

Art exhibitions app ranking exhibitions by popularity. As exhibitions gain likes they move up the Home page so users can easily see what exhibitions are popular. 

## User stories: 

A user can:

* Login/sign up.
* Once logged in users can view exhibition likes. General exhibition information is viewable to all. 
* Edit their account details.
* Browse and filter exhibitions on the Home Page.
* View exhibition information.
* Like and comment on exhbitions, exhibitions move up the Home page as they accumulate likes. 
* Like comments, comments also move up the coment list as they accumulate likes.
* Add exhibitions; obtaining an image for their exhibition using Filestack upload.

## Prerequisites

Make sure you have installed:

* Ruby, version 2.6.1 or newer
* Postgres
* Rails, version 5.2.3 or newer

You can check in the terminal:

```bash
ruby -v
rails -v
postgres -v
```

This should output some information on the installed versions. If not, you can refer to the [Ruby](https://www.ruby-lang.org/en/documentation/installation/ "Ruby"), [Postgres](https://www.postgresql.org/ "Postgres") and [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html "Rails") documentation.


## Getting started

Fork and clone this repository. Start Postgres.

## Installation

On a terminal window, use the gem manager [bundler](https://bundler.io/ "bundler") to install all dependencies. Create, migrate and seed the database. Start the Rails server. To do all this, run these commands, one at the time.

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails start
```

Visit localhost:3000.

**That's it, you're all set!**

## Notes

This app is a paired programming project created by [Le H Ngo](https://github.com/seijihg "Le H Ngo") and [Louise Norris](https://github.com/louisenorris "Louise Norris").
