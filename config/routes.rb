Rails.application.routes.draw do
  

#----------------------- Combustible -------------------
  get 'combustible/show'
  get 'combustible/new'
  get 'combustible/edit'
  delete "combustible/:numcomb" => "combustible#destroy"
  get 'combustible/:numcomb/edit' =>"combustible#edit"
  put "combustible/:numcomb" =>"combustible#update"
  post "combustible/new" =>"combustible#create"
  get 'combustible/view_pdf' => 'combustible#view_pdf'
  get 'combustible/queries'

#----------------------- Vehiculos -------------------
 
  get'vehiculos/show'
  get 'vehiculos/new'
  get "vehiculos/edit"
  delete "vehiculos/:matricula" => "vehiculos#destroy"
  get 'vehiculos/:matricula/edit' =>"vehiculos#edit"
  put "vehiculos/:matricula" =>"vehiculos#update"
  post "vehiculos/new" =>"vehiculos#create"
  get 'vehiculos/view_pdf' => 'vehiculos#view_pdf'


#----------------------- Vales de compra -------------
  get 'vales/show'
  get 'vales/new'
  get 'vales/edit'
  get 'vales/update'
  delete "vales/:id" => "vales#destroy"
  get 'vales/:id/edit' =>"vales#edit"
  put "vales/:id" =>"vales#update"
  post "vales/new" =>"vales#create"
  get "vales/return_orden/:ejercicio" => "vales#return_orden"
  get 'vales/view_pdf' => 'vales#view_pdf'
  get 'vales/queries'
  
#----------------------- Contables -------------------  
  get 'contables/show'
  get 'contables/new'
  get 'contables/edit'
  get 'contables/update'
  delete "contables/:id" => "contables#destroy"
  get 'contables/:id/edit' =>"contables#edit"
  put "contables/:id" =>"contables#update"
  post "contables/new" =>"contables#create"
  get "contables/return_orden/:ejercicio" => "contables#return_orden"



#----------------------- Propuestas -------------------  
  get 'propuestas/edit'
  get 'propuestas/new'
  get 'propuestas/show'
  get 'propuestas/queries'
  get 'propuestas/propuesta'
  get 'propuestas/view_pdf/:id' =>'propuestas#view_pdf'
  get 'propuestas/view_pdf' => 'propuestas#view_pdf'
  get 'propuestas/propuesta_id/id' => "propuestas#propuesta_id"
  get 'propuestas/update'
  delete "propuestas/:id" => "propuestas#destroy"
  get 'propuestas/:id/edit' =>"propuestas#edit"
  put "propuestas/:id" =>"propuestas#update"
  post "propuestas/new" =>"propuestas#create"

  get "propuestas/search" => "propuestas#search"
  post "propuestas/search" => "propuestas#search"

  get "propuestas/return_datos_vale/:id" => "propuestas#return_datos_vale"
  

#----------------------- Concejalías -------------------  
  get 'concejalias/show'
  get 'concejalias/new'
  get 'concejalias/edit'
  get 'concejalias/update'
  delete "concejalias/:id" => "concejalias#destroy"
  get 'concejalias/:id/edit' =>"concejalias#edit"
  put "concejalias/:id" =>"concejalias#update"
  post "concejalias/new" =>"concejalias#create"
  get "concejalias/return_nombre/:id" => "concejalias#return_nombre" 

#----------------------- Proveedores -------------------  
  get 'proveedores/show'
  get 'proveedores/new'
  get 'proveedores/edit'
  get "proveedores/show_all"
  delete "proveedores/:id" => "proveedores#destroy"
  get 'proveedores/:id/edit' =>"proveedores#edit"
  put "proveedores/:id" =>"proveedores#update"
  post "proveedores/new" =>"proveedores#create"
  get  "proveedores/return_nombre/:id" => "proveedores#return_nombre"

#----------------------- Cargos -------------------
 
  get'cargos/show'
  get 'cargos/new'
  get "cargos/edit"
  delete "cargos/:id" => "cargos#destroy"
  get 'cargos/:id/edit' =>"cargos#edit"
  put "cargos/:id" =>"cargos#update"
  post "cargos/new" =>"cargos#create"

#-------------------------MAIN---------------------
  get 'main/show'
  get 'main/new'
  get "main/return_nombre"
  get "main/return_nombre/:id" => "main#return_nombre"  
  delete "main/:id" => "main#destroy"
  get "main/:id/edit" => "main#edit"
  put "main/:id" =>"main#update"
  post "main/new" =>"main#create"


#-------------------------RELACIONES---------------------
  get 'relaciones/show'
  get 'relaciones/new'
  get "relaciones/return_nombre"
  get "relaciones/return_nombre/:id" => "relaciones#return_nombre"  
  delete "relaciones/:id" => "relaciones#destroy"
  post "relaciones/new" =>"relaciones#create"

  
  
  #post "users" => "main#create"

  devise_for :users
  get 'inicio/index'

devise_scope :user do
  match '/sign-in' => "devise/sessions#new", :as => :login, via: [:get, :post]
end



 
root 'inicio#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
