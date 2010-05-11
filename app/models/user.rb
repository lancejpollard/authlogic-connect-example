class User < ActiveRecord::Base
  acts_as_authentic
  
  include Profile
end