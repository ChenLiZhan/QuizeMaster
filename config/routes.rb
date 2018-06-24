Rails.application.routes.draw do
  root to: "pages#root"

  namespace :api do
    namespace :v1 do
      resources :questions
    end
  end
end
