# frozen_string_literal: true

describe 'routes for users' do
  describe 'Logging in' do
    describe 'GET /auth/shibboleth' do
      subject { get('/auth/shibboleth') }

      it { is_expected.to route_to({ controller: 'omniauth_callbacks', action: 'passthru' }) }
    end

    describe 'POST /auth/shibboleth' do
      subject { post('/auth/shibboleth') }

      it { is_expected.to route_to({ controller: 'omniauth_callbacks', action: 'passthru' }) }
    end

    describe 'GET /auth/shibboleth/callback' do
      subject { get('/auth/shibboleth/callback') }

      it { is_expected.to route_to({ controller: 'omniauth_callbacks', action: 'shibboleth' }) }
    end

    describe 'POST /auth/shibboleth/callback' do
      subject { post('/auth/shibboleth/callback') }

      it { is_expected.to route_to({ controller: 'omniauth_callbacks', action: 'shibboleth' }) }
    end
  end

  describe 'Logging out' do
    describe 'GET /logout' do
      subject { get('/logout') }

      it { is_expected.to route_to({ controller: 'devise/sessions', action: 'destroy' }) }
    end
  end
end
