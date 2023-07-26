# frozen_string_literal: true

class OmniauthCallbacksController < Devise::OmniauthCallbacksController
  before_action :require_valid_omniauth, only: :shibboleth

  def shibboleth
    set_user
    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
      set_flash_message(:notice, :success, kind: 'NYU Shibboleth')
      logger.info(find_message(:success, kind: 'NYU Shibboleth'))
    else
      logger.error(find_message(:failure, kind: 'NYU Shibboleth', reason: 'User not persisted'))
      session['devise.shibboleth_data'] = request.env['omniauth.auth']
      redirect_to root_path
    end
  end

  def failure
    logger.error("OmniAuth is failing - #{failure_message}")
    redirect_to root_path
  end

  private

  def require_valid_omniauth
    head :bad_request unless valid_omniauth?
  end

  def valid_omniauth?
    omniauth.present?
  end

  def omniauth
    @omniauth ||= request.env['omniauth.auth']
  end

  def omniauth_provider
    @omniauth_provider ||= omniauth.provider
  end

  def attributes_from_omniauth
    {
      provider: omniauth.provider,
      username: omniauth.uid,
      email: omniauth_email,
      firstname: omniauth_firstname,
      lastname: omniauth_lastname,
    }
  end

  def omniauth_email
    @omniauth_email ||= omniauth.info.email
  end

  def omniauth_firstname
    @omniauth_firstname ||= omniauth.info.first_name
  end

  def omniauth_lastname
    @omniauth_lastname ||= omniauth.info.last_name
  end

  def set_user
    # Find existing or initialize new user,
    # and save new attributes each time
    @user = find_user
    @user.update_attributes(attributes_from_omniauth)
  end

  def find_user
    @find_user ||= User.create_from_provider_data(request.env['omniauth.auth'])
  end
end
