class User < ApplicationRecord
  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:shibboleth]

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.

  def self.from_omniauth(auth)
    find_or_create_by(provider: auth.provider, username: auth.uid) do |user|
      user.email = "#{auth.uid}@nyu.edu"
      user.firstname = auth.info['first_name']
      user.lastname = auth.info['last_name']
    end
  end

  def to_s
    "#{firstname} #{lastname}"
  end
end
