# This is how your config file should look.
# This is my Heroku config file.
# Heroku recommends setting environment variables on their system

if Rails.env.to_s == "production"
  AuthlogicConnect.config = {
    :services => {
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