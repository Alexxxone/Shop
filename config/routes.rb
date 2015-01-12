Products::Application.routes.draw do

  resources :categories do
    resources :products do
      resources :reviews
    end
  end
  resources :products do
    resources :reviews
  end
  resources :categories

  devise_for :users, path_names: { sign_in: 'login', sign_out: 'logout'}

  root to: 'products#index'

end
