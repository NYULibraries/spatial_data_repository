require 'byebug'
require 'ostruct'

module Features
  module SessionHelpers
    # @WIP: Authenticate
    # Poltergeist-friendly sign-in
    # Use this in feature tests
    def sign_in(who = :user)
      user = create(:user)
      # extra = OpenStruct.new(identities: ["foo"])

      OmniAuth.config.test_mode = true
      OmniAuth.config.add_mock(:nyulibraries, uid: user) #, extra: extra)
      visit user_nyulibraries_omniauth_authorize_path
    end
  end
end
