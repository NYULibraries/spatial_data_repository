module OmniAuth
  module Strategies
    class Shibboleth < OmniAuth::Strategies::OAuth2
      if defined?(::Rails) && ::Rails.env.development?
        silence_warnings do
          OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
        end
      end

      option :authorize_params, { scope: "openid" }
      option :client_options, { site: (Settings.LOGIN_URL || "https://qa.auth.it.nyu.edu"),
                                authorize_url: "/oauth2/authorize",
                                token_url: "/oauth2/token",
                                redirect_uri: Settings.REDIRECT_URI }

      uid do
        raw_info["sub"]
      end

      info do
        {
          email: raw_info["sub"],
          last_name: last_name,
          first_name: first_name
        }
      end

      def raw_info
        response = access_token.get("/oauth2/userinfo?schema=openid")
        Rails.logger.info("Shibboleth raw_info: #{response.parsed}")
        @raw_info ||= response.parsed
      end

      # Extract Last Name from identity
      def last_name
        @last_name ||= raw_info["lastname"] rescue nil
      end

      # Extract First Name from identity
      def first_name
        @first_name ||= raw_info["firstname"] rescue nil
      end

      def log(level, message)
        Rails.logger.send(level, "(#{name}) #{message}")
      end
    end
  end
end
