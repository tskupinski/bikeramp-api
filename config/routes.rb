Rails.application.routes.draw do
  scope :api do
    resources :trips, only: :create
  end
end
