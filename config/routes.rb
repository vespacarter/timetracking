Rails.application.routes.draw do
# verbo 'ruta' => 'controlador#accion'
  get '/' => 'site#home'
  get '/contact' => 'site#contact'
  get '/projects' => 'projects#index'
end
