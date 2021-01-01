Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'welcome#index'
  get '/repos', to: 'welcome#show', as: 'repos'
  get '/return', to: 'welcome#create', as: 'auth'
end
