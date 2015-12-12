Rails.application.routes.draw do
# verbo 'ruta' => 'controlador#accion'

  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  resources :projects, only: [:index, :show, :new, :create, :update, :destroy] do
  	resources :entries ,only: [:index, :new, :create, :destroy]
  end
end
