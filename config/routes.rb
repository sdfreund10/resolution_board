Rails.application.routes.draw do
  devise_for :users
  resources :resolutions do
    resources :updates
  end

  root to: redirect('/resolutions')
end
