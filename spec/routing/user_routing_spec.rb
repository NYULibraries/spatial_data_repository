# frozen_string_literal: true

describe 'routes for users' do
  describe 'GET /users/auth/shibboleth' do
    subject { get('/users/auth/shibboleth') }
    it do
      should route_to({
                        controller: 'users/omniauth_callbacks',
                        action: 'passthru'
                      })
    end
  end

  describe 'POST /users/auth/shibboleth' do
    subject { post('/users/auth/shibboleth') }
    it do
      should route_to({
                        controller: 'users/omniauth_callbacks',
                        action: 'passthru'
                      })
    end
  end

  describe 'GET /users/auth/shibboleth/callback' do
    subject { get('/users/auth/shibboleth/callback') }
    it { should route_to({ controller: 'users/omniauth_callbacks', action: 'shibboleth' }) }
  end

  describe 'POST /users/auth/shibboleth/callback' do
    subject { post('/users/auth/shibboleth/callback') }
    it { should route_to({ controller: 'users/omniauth_callbacks', action: 'shibboleth' }) }
  end
end
