# frozen_string_literal: true

describe 'routes for users' do
  describe 'GET /auth/shibboleth' do
    subject { get('/auth/shibboleth') }
    it do
      should route_to({
                        controller: 'omniauth_callbacks',
                        action: 'passthru'
                      })
    end
  end

  describe 'POST /auth/shibboleth' do
    subject { post('/auth/shibboleth') }
    it do
      should route_to({
                        controller: 'omniauth_callbacks',
                        action: 'passthru'
                      })
    end
  end

  describe 'GET /auth/shibboleth/callback' do
    subject { get('/auth/shibboleth/callback') }
    it { should route_to({ controller: 'omniauth_callbacks', action: 'shibboleth' }) }
  end

  describe 'POST /auth/shibboleth/callback' do
    subject { post('/auth/shibboleth/callback') }
    it { should route_to({ controller: 'omniauth_callbacks', action: 'shibboleth' }) }
  end
end
