# frozen_string_literal: true

class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation if Blacklight::Utils.needs_attr_accessible?
  # Connects this user object to Blacklights Bookmarks.
  include Blacklight::User
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable

  devise :omniauthable, omniauth_providers: [:shibboleth]

  # Method added by Blacklight; Blacklight uses #to_s on your
  # user class to get a user-displayable login/identifier for
  # the account.
  def to_s
    email
  end

  def self.create_from_provider_data(provider_data)
    where(provider: provider_data.provider,
          username: provider_data.uid)
      .first_or_create do |user|
      user.email = provider_data.info.email
      user.username = provider_data.uid
    end
  end
end
