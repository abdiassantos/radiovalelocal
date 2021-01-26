# frozen_string_literal: true

# AdminRoutes
module AdminRoutes
  def self.extended(router)
    router.instance_exec do
      namespace :admin do
        root to: 'pages#dashboard'

        resources :articles, path: :noticias do
          member do
            post :enable
          end
        end
        resources :pages, path: :paginas
        resources :banners, path: :banners
        resources :contacts, path: :contato
        resources :editories, path: :editorias
        resources :events, path: "coluna-social"
        resources :galleries, path: :fotos
        resources :radios, path: :'radio-ao-vivo'
        resources :social_networks, path: :'redes-sociais'
        resources :medias
        resources :videos
        resources :users
        resources :news do
          member do
            post :enable
          end
        end

        resources :blogs, path: :blogs do
          resources :notes, path: :publicacoes, controller: 'blogs/notes'do
            member do
              post :enable
            end
          end
        end

        resources :blog_cities, path: :'blog-cidades' do
          resources :notes, path: :publicacoes, controller: 'blog_cities/notes' do
            member do
              post :enable
            end
          end
        end

        resources :counties, path: :municipios do
          resources :news,
                    path: :noticias,
                    controller: 'counties/news'
        end
      end
    end
  end
end
