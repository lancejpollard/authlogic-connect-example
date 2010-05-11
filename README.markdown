# Authlogic Connect Example

## Install and use

    git clone
    cd authlogic-connect-example
    bundle install
    rake db:migrate
    rails server thin
    
## Deploy to Heroku

    heroku create --stack bamboo-ree-1.8.7 --remote bamboo my-app-name
    git push bamboo master
    heroku rake db:migrate