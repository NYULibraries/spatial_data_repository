class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller 
  include Blacklight::Controller
  layout 'blacklight'

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

# Alias new_session_path as login_path for default devise config
def new_session_path(scope)
  login_path
end

def after_sign_in_path_for(resource)
  request.env['omniauth.origin'] || stored_location_for(resource) || root_path
end

# After signing out from the local application,
# redirect to the logout path for the Login app
def after_sign_out_path_for(resource_or_scope)
  if logout_path.present?
    logout_path
  else
    super(resource_or_scope)
  end
end

def logout_path
	"https://login.library.nyu.edu/logout"
end
private :logout_path

end
