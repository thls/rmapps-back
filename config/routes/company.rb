resources :companies do
  resources :equipment, only: :create
end
