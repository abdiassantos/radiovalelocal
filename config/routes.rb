# frozen_string_literal: true

Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  get "sobre-radio", to: "pages#about_radio", as: :about_radio
  get "sobre-grupo", to: "pages#about_group", as: :about_group
  resources :articles, path: :noticias, only: %i[index show]
  resources :contacts, path: :contato, only: %i[index create]
  resources :editories, path: :editorias, only: %i[index show]
  resources :events, path: "coluna-social", only: %i[index show]
  resources :galleries, path: :fotos, only: %i[index show]
  resources :radios, path: :'radio-ao-vivo', only: [:index]
  resources :social_networks, path: :'redes-sociais', only: [:index]

  resources :blog_cities, path: :'blog-cidades', only: %i[index show] do
    resources :notes,
              path: :publicacoes,
              controller: 'blog_cities/notes',
              only: %i[index show]
  end

  resources :blogs, path: :blogs, only: %i[index show] do
    resources :notes,
              path: :publicacoes, controller: 'blogs/notes',
              only: %i[index show]
  end

  resources :counties, path: :municipios, only: %i[index show] do
    resources :news,
              path: :noticias,
              controller: 'counties/news',
              only: %i[index show]
  end

  resources :videos, path: :videos, only: %i[index show] do
    collection do
      get :youtube, as: :'youtube-ao-vivo'
    end
  end

  ## NAMESPACE ADMIN: config/routes/admin_routes.rb
  extend AdminRoutes

  devise_for :users

  root 'pages#index'
end
