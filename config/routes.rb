Rails.application.routes.draw do
  resources :resolutions do
    resources :updates
  end

  root :to => redirect('/resolutions')
end
