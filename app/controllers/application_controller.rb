class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end
  protect_from_forgery
  
  before_filter do
    ids = ActiveRecord::SessionStore::Session.all.map{|s| kv = s.data["warden.user.user.key"]; kv.nil? ? nil : kv[1]}.compact.uniq
    @logged_in_users = User.where(:id => ids)
    @num_polls = Poll.count
    @num_users = User.count
  end
end
