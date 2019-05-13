Rails.application.routes.draw do
  namespace :api do
    resources :dogs, only: %i[index show create destroy update]
  end
end
