module OmniAuth
  module Strategies
    require 'omniauth-oauth2'
    class Shibboleth < OmniAuth::Strategies::OAuth2
      if defined?(::Rails) && ::Rails.env.development?
        silence_warnings do
          OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
        end
      end
      option :name, :shibboleth

      option :client_options, {
        site: (ENV['LOGIN_URL'] || "https://qa.auth.nyu.edu:443"),
        authorize_path: "/oauth2/authorize"
      }

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
    end
  end
end
