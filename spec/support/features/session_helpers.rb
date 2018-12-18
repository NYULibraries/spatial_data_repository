module Features
  module SessionHelpers
    # @TODO: Authenticate
    # sign_in
    # 
    def sign_in
      user = FactoryBot.create(:user).username
    end
  end
end
