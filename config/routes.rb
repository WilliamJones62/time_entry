Rails.application.routes.draw do
  get 'entries/transmit'
  post 'entries/export'
  resources :entries
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'entries#index'
end
