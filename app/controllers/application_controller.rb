class ApplicationController < ActionController::Base
  # Adds a few additional behaviors into the application controller
  include Blacklight::Controller
  layout :determine_layout if respond_to? :layout

  before_action :allow_geoblacklight_params

  def allow_geoblacklight_params
    # Blacklight::Parameters will pass these to params.permit
    blacklight_config.search_state_fields.append(Settings.GBL_PARAMS)
  end

  # Alias new_session_path as login_path for default devise config
  def new_session_path(_scope)
    login_path
  end

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || root_path
  end

  def current_user_dev
    @current_user_dev ||= User.find_by(username: 'admin', provider: 'nyulibraries') || User.find_or_create_by!(guest_user_params)
  end

  alias current_user current_user_dev if Rails.env.development?

  # After signing out from the local application,
  # redirect to the logout path for the Login app
  def after_sign_out_path_for(resource_or_scope)
    Faraday.get(logout_path) if logout_path.present?
    super(resource_or_scope)
  end

  private

  def logout_path
    Settings.LOGOUT_URL || 'https://qa.auth.it.nyu.edu/oidc/logout'
  end

  def guest_user_params
    { provider: 'nyulibraries',
      email: "anon_guest@example.com",
      username: 'admin',
      firstname: 'Anon',
      lastname: 'Guest' }
  end
end
