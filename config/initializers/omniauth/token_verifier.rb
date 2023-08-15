module OmniAuth
  # Derived from https://github.com/cookpad/omniauth-rails_csrf_protection/blob/master/lib/omniauth/rails_csrf_protection/token_verifier.rb
  # This specific implementation has been pared down and should not be taken as the most correct way to do this.
  class TokenVerifier
    include ActiveSupport::Configurable
    include ActionController::RequestForgeryProtection

    def call(env)
      @request = ActionDispatch::Request.new(env.dup)
      raise OmniAuth::AuthenticityError unless verified_request?
    end

    private
    attr_reader :request
    delegate :params, :session, to: :request
  end
end
