Rails.application.routes.draw do
  devise_for :users, path: '', controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  devise_scope :user do
    mount Blacklight::Engine => '/'
    mount Geoblacklight::Engine => 'geoblacklight'

    concern :gbl_exportable, Geoblacklight::Routes::Exportable.new
    resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
      concerns :gbl_exportable
    end
    concern :gbl_wms, Geoblacklight::Routes::Wms.new
    namespace :wms do
      concerns :gbl_wms
    end
    concern :gbl_downloadable, Geoblacklight::Routes::Downloadable.new
    namespace :download do
      concerns :gbl_downloadable
    end
    resources :download, only: [:show]


    root to: "catalog#index"
    concern :searchable, Blacklight::Routes::Searchable.new

    resource :catalog, only: [:index], as: 'catalog', path: '/catalog', controller: 'catalog' do
      concerns :searchable
    end

    concern :exportable, Blacklight::Routes::Exportable.new

    resources :solr_documents, only: [:show], path: '/catalog', controller: 'catalog' do
      concerns :exportable
    end

    resources :bookmarks do
      concerns :exportable

      collection do
        delete 'clear'
      end
    end

    # NYU Routes
    get 'logout', to: 'devise/sessions#destroy', as: :logout
    get 'login', to: redirect { |params, request| "#{Rails.application.config.relative_url_root}/auth/shibboleth?#{request.query_string}" }, as: :login

    resources :suggest, only: :index, defaults: {format: 'json'}

    resource :feedback_form, path: 'feedback', only: [:new, :create]
    get 'feedback' => 'feedback_forms#new'
  end
end

