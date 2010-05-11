class UsersController < ApplicationController
  before_filter :require_no_user, :only => [:new, :create]
  before_filter :require_user, :only => [:show, :edit, :update]
  before_filter :admin_only, :only => :detonate
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    # block! see user_sessions_controller.rb for description
    @user.save do |result|
      if result
        flash[:notice] = "Account registered!"
        redirect_back_or_default profile_url(@user)
      else
        render :action => :new
      end
    end
  end

  def show
    @user = @current_user
    @profile = @user.profile
  end

  def edit
    @user = @current_user
  end

  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    @user.update_attributes(params[:user]) do |result|
      if result
        flash[:notice] = "Account updated!"
        redirect_to profile_url(@user)
      else
        render :action => :edit
      end
    end
  end
  
  # for debugging...
  def detonate
    User.all.collect(&:destroy)
    redirect_to signup_url
  end
end
