# frozen_string_literal: true

describe 'routes for users' do
  describe 'Logging in' do
    describe 'POST /auth/entra_id' do
      subject { post('/auth/entra_id') }

      it { is_expected.to route_to({ controller: 'omniauth_callbacks', action: 'passthru' }) }
    end

    describe 'GET /auth/entra_id/callback' do
      subject { get('/auth/entra_id/callback') }

      it { is_expected.to route_to({ controller: 'omniauth_callbacks', action: 'entra_id' }) }
    end

    describe 'POST /auth/entra_id/callback' do
      subject { post('/auth/entra_id/callback') }

      it { is_expected.to route_to({ controller: 'omniauth_callbacks', action: 'entra_id' }) }
    end
  end

  describe 'Logging out' do
    describe 'GET /logout' do
      subject { get('/logout') }

      it { is_expected.to route_to({ controller: 'devise/sessions', action: 'destroy' }) }
    end
  end
end
