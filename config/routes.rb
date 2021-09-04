Rails.application.routes.draw do

 root 'public/homes#top'
 get '/customers/edit' => 'public/customers#edit',as: 'public_customers_edit'
 patch '/customers' => 'public/customers#update',as: 'public_customers_update'
 get '/customers/unsubscribe' => 'public/customers#unsubscribe',as: 'public_customers_unsubscribe'
 delete '/cart_items/destroy_all' => 'puclic/cart_items#destroy_all'

  devise_for :admins, controllers: {
  sessions:      'admins/sessions',
  passwords:     'admins/passwords',
  registrations: 'admins/registrations'
}

  devise_for :customers, controllers: {
  sessions:      'customers/sessions',
  passwords:     'customers/passwords',
  registrations: 'customers/registrations'
}

 get '/admin' => 'admin/homes#top'

 namespace :admin do

   resources :items, except: [:destroy]
   resources :genres,only:[:index,:create,:edit,:update]
   resources :customers,only:[:index,:show,:edit,:update]
   resources :orders,only:[:show,:update]
   resources :order_items, only:[:update]

  end

 get '/about' => 'public/homes#about'

 namespace :public do

   resources :items,only:[:index,:show]
   resources :cart_items,only:[:index,:update,:destroy,:create]
   resources :oders,only:[:new,:create,:index,:show]
   resources :addresses,only:[:index,:edit,:create,:update,:destroy]

  end

  get '/customers/my_pag' => 'public/customers#show'
  patch '/customers/withdraw' => 'public/customers#withdraw'
  post '/orders/confirm' => 'puclic/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'

end
