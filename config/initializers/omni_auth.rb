require_relative '../../config/initializers/omniauth/token_verifier'
OmniAuth.config.request_validation_phase = OmniAuth::TokenVerifier.new
