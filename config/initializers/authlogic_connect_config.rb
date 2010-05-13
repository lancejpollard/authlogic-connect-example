# This is how your config file should look.
# This is my Heroku config file.
# Heroku recommends setting environment variables on their system

case Rails.env
when "development"
  AuthlogicConnect.config = YAML.load_file("config/authlogic.yml")
when "production"
  AuthlogicConnect.config = {
    :connect => {
      :twitter => {
        :key => ENV["SERVICES_TWITTER_KEY"],
        :secret => ENV["SERVICES_TWITTER_SECRET"],
        :label => "Twitter"
      },
      :facebook => {
        :key => ENV["SERVICES_FACEBOOK_KEY"],
        :secret => ENV["SERVICES_FACEBOOK_SECRET"],
        :label => "Facebook"
      },
      :google => {
        :key => ENV["SERVICES_GOOGLE_KEY"],
        :secret => ENV["SERVICES_GOOGLE_SECRET"],
        :label => "Google"
      },
      :yahoo => {
        :key => ENV["SERVICES_YAHOO_KEY"],
        :secret => ENV["SERVICES_YAHOO_SECRET"],
        :label => "Yahoo"
      },
      :vimeo => {
    
      }
    }
  }
end
