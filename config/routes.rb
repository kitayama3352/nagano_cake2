Rails.application.routes.draw do

 root 'public/homes#top'

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

 namespace :public do

   resources :items,only:[:index,:show]
   resources :customers,only:[:show,:edit,:update]
   resources :cart_items,only:[:index,:update,:destroy,:create]
   resources :oders,only:[:new,:create,:index,:show]
   resources :addresses,only:[:index,:edit,:create,:update,:destroy]

  end

  get '/customers/unsubscribe' => 'public/customers#unsubscribe'
  patch '/customers/withdraw' => 'public/customers#withdraw'
  delete '/cart_items/destroy_all' => 'puclic/cart_items#destroy_all'
  post '/orders/confirm' => 'puclic/orders#confirm'
  get '/orders/complete' => 'public/orders#complete'

end
