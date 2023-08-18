module OmniAuth
  module Strategies
    class Shibboleth < OmniAuth::Strategies::OAuth2
      if defined?(::Rails) && ::Rails.env.development?
        silence_warnings do
          OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE
        end
      end

      option :name, :shibboleth
      option :authorize_params, { scope: "openid" }

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

      def callback_url
        full_host + script_name + callback_path
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
