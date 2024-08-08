Rails.application.routes.draw do
  devise_for :users, path: '', controllers: {omniauth_callbacks: 'omniauth_callbacks'}
  devise_scope :user do
    mount Blacklight::Engine => '/'
    mount Geoblacklight::Engine => 'geoblacklight'

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
    
    # NYU Routes
    get 'logout', to: 'devise/sessions#destroy', as: :logout

    resources :suggest, only: :index, defaults: {format: 'json'}
  end
end

