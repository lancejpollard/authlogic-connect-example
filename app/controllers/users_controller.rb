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
        redirect_to login_url
      end
    end
  end

  def show
    puts "SESSION: #{session.inspect}"
    puts @current_user.access_tokens.inspect
    @user = @current_user
    @profile = @user.profile
  end

  def edit
    @user = @current_user
  end

  def update
    return create unless @current_user
    @user = @current_user # makes our views "cleaner" and more consistent
    @user.update_attributes(params[:user]) do |result|
      if result
        flash[:notice] = "Account updated!"
        redirect_to profile_url(@user)
      else
        raise @user.errors.inspect
        render :action => :edit
      end
    end
  end
  
  # for debugging...
  def detonate
    session.clear
    User.all.collect(&:destroy)
    redirect_to login_url
  end
end
