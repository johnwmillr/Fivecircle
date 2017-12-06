# Fivecircle #
[Fivecircle](https://fivecircle.herokuapp.com) is a revolutionary new app for sharing geo-tagged memories with friends. [Sign up for an account](https://fivecircle.herokuapp.com/users/sign_up) and start dropping posts around town!

## Setup ##
#### Ruby version ####
Ruby 2.3.0
#### System dependencies ####
Check out the `Gemfile`
#### Configuration ####
`$bundle install`
#### Database ####
```
$bundle exec rake db:migrate
$bundle exec rake db:seed
```
#### Server ####
`$bundle exec rails server -p $PORT -b $IP` 
