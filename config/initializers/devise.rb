Figs.load() # Load app secrets into ENV

Devise.setup do |config|
  config.mailer_sender = 'lib-no-reply@nyu.edu'
  require 'devise/orm/active_record'
  config.secret_key = ENV['DEVISE_SECRET_TOKEN']
  config.strip_whitespace_keys = [ :email ]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 10
  config.reconfirmable = true
  config.rememberable_options = {}
  config.password_length = 8..128
  config.reset_password_within = 60.minutes
  config.sign_out_via = :get
  config.omniauth :nyulibraries, ENV['APP_ID'], ENV['APP_SECRET'], client_options: {
      site: ENV['LOGIN_URL'],
      authorize_path: '/oauth/authorize'
    }
end
