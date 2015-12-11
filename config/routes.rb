Rails.application.routes.draw do
# verbo 'ruta' => 'controlador#accion'
  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  get '/projects' => 'projects#index'
  get '/projects/new' => 'projects#new'
  get '/projects/:id' => "projects#show"
  post '/projects' => 'projects#create'
  get '/projects/:id/edit' => 'projects#edit'
end
