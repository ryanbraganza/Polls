class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery
  
  before_filter do
    @logged_in_usernames = ActiveRecord::SessionStore::Session.all.map{|s| kv = s.data["warden.user.user.key"]; kv[0].constantize.find(kv[1]).username}
  end
end
