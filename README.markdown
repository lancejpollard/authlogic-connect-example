# Authlogic Connect Example

http://www.themodestrubyist.com/2010/03/05/rails-3-plugins---part-2---writing-an-engine/

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