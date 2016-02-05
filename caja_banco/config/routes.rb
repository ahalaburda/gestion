Rails.application.routes.draw do

  resources :asientos_automaticos_detalles

  resources :asientos_automaticos

  resources :cuentas

  get 'libros_de_cajas/libro_de_caja'

  resources :apertura_cajas_detalles

  get 'audit/index'

  resources :parametros

  get 'libros_de_bancos/libro_de_banco'

  resources :apertura_cajas

  resources :movimientos_de_cajas do
    resources :movimientos_de_cajas_detalles
  end

  resources :movimientos_de_bancos do
    resources :movimientos_de_bancos_detalles
  end

  resources :boletas_de_depositos do
    resources :boletas_de_depositos_detalles
  end

  resources :auditorias

  resources :cajas

  resources :cheques_propios

  resources :chequeras

  resources :cuentas_bancarias

  resources :firmantes

  resources :cheques_entrantes

  resources :personas

  resources :ciudades

  resources :departamentos

  resources :paises

  resources :estados

  resources :tipos_de_personas

  resources :tipos_de_movimientos

  resources :bancos

  devise_for :users, path: "/", path_names: {
    sign_in:        'login',
    sign_out:       'logout',
    password:       'secret',
    confirmation:   'verification',
    unlock:         'unblock',
    registration:   'register',
    sign_up:        ''
  }

  resources :users

  get 'home/index'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
 root 'home#index'

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