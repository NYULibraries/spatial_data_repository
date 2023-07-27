Devise.setup do |config|
  config.mailer_sender = 'lib-no-reply@nyu.edu'
  require 'devise/orm/active_record'
  config.secret_key = Settings.DEVISE_SECRET_TOKEN
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.rememberable_options = {}
  config.password_length = 8..128
  config.reset_password_within = 60.minutes
  config.sign_out_via = :get
  config.omniauth :shibboleth, Settings.APP_ID, Settings.APP_SECRET, client_options: {
    site: (Settings.LOGIN_URL || "https://qa.auth.it.nyu.edu"),
    authorize_url: "/oauth2/authorize",
    authorize_params: { scope: "openid", response_type: "code", client_id: Settings.APP_ID, redirect_uri: Settings.REDIRECT_URI },
    token_url: "/oauth2/token",
    redirect_uri: Settings.REDIRECT_URI,
    logger: Rails.logger
  }
end
