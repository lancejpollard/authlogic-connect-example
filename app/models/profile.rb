module Profile
  def self.included(base)
    base.class_eval do
      include InstanceMethods
    end
  end
  
  module InstanceMethods
    
    def facebook
      if self.active_token.service_name == :facebook
        @facebook ||= JSON.parse(self.active_token.get("/me"))
      end
    end
    
    def twitter
      if self.active_token.service_name == :twitter
        @twitter ||= JSON.parse(self.active_token.get("/account/verify_credentials.json").body)
      end
    end

    def google
      @google ||= "" # todo
    end

    # primitive profile to show what's possible
    def profile
      unless @profile
        if facebook
          @profile = {
            :id     => facebook["id"],
            :name   => facebook["name"],
            :photo  => "https://graph.facebook.com/#{facebook["id"]}/picture",
            :link   => facebook["link"],
            :title  => "Facebook"
          }
        elsif twitter
          @profile = {
            :id     => twitter["id"],
            :name   => twitter["name"],
            :photo  => twitter["profile_image_url"],
            :link   => "http://twitter.com/#{twitter["screen_name"]}",
            :title  => "Twitter"
          }
        else
          @profile = {
            :id     => "unknown",
            :name   => "User",
            :photo  => "/images/icons/google.png",
            :link   => "/images/icons/google.png",
            :title  => "Google"
          }
        end
      end

      @profile
    end
    
  end
  
end