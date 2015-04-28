Roots::Application.routes.draw do

 concern :globales do
    collection do
      post :borrar_seleccion
      get :editar_multiples
      put :actualizar_multiples
      post :importar
    end
  end

  get 'salir', to: 'rba/sesiones#salir', :as => :salir
  get '/rba/sesiones/actualizaSesion/:modelo/:id', to: 'rba/sesiones#actualizaSesion', :as => :actualizaSesion
  post 'rba/mover_items', to: 'rba/nodos#mover_items'
  root 'rba/bienvenidos#inicio'
  
  namespace :rad do
    resources :operaciones do
      post :compatibles, on: :collection
      get :compatibles, on: :member
      concerns [:globales]
    end
    resources :operaciontipos,
    concerns: [:globales]

  end
  namespace :rfi do
    resources :flujofondos
  end
  namespace :rba do
    resources :actividades,
    :actividadtipos, 
    :arboles, 
    :campanas, 
    :campanatipos, 
    :catfiscales, 
    :empresagrupos, 
    :empresas,
    :establecimientos, 
    :libros,
    :lotes, 
    :loteutilizaciones,
    :nodos, 
    :organizaciontipos,
    :organizaciones,
    :temporadas,
    :usuarios,
    concerns: [:globales]
    resources :sesiones
  end

  namespace :rco do
    resources :cuentas do
      post :x_operacion_tipo, on: :collection
      concerns [:globales]
    end
    resources :cuentatipos,
    :registros, 
    :asientos, 
    :cotizaciones,
    :monedas,
    concerns: [:globales]
  end

  namespace :rga do
    resources :categorias,
    :categoriatipos,
    :estados,
    :estados_eventos,
    :eventotipos,
    :rodeos,
    concerns: [:globales]
    resources :animales do
      post :disponibles, on: :collection
      concerns [:globales]
    end

    resources :registros do
      get :planilla, on: :collection
      get :existencia, on: :collection
      concerns [:globales]
    end
  
    resources :eventos do
      get :actualizar_categorias, on: :member
      get :actualizar_estados, on: :member
      concerns [:globales]
    end
  end

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
