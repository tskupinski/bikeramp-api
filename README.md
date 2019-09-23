# Bikeramp - simple bike trip tracker for couriers with weekly and monthly statistics

## Technology

| Name |  Version |
| :--: | :---: |
| [Ruby](https://www.ruby-lang.org) | 2.6.4 |
| [Ruby on Rails](http://www.rubyonrails.org/) | 6.0.0 |

## Links

- [Heroku](https://bikeramp-staging-api.herokuapp.com/)
- [Docs](https://backend-task.elpassion.com/#trips)

## Setup

#### Clone the repository

    $ git clone https://github.com/tskupinski/bikeramp-api.git

#### Install gems

    $ bundle install

### Create your local database: 

    $ rails db:create
    
### Migrate your database:: 

    $ rails db:migrate
    
### Seed database with examples:
    
    $ rails db:seed
    
### Run the application

    $ rails server

Your app should now be running on [localhost:3000](http://localhost:3000). 
Please keep in mind that this is only API there are no views implemented.
