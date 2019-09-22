Rails.application.routes.draw do
  scope :api do
    resources :trips, only: :create

    namespace :stats do
      resource :weekly, controller: :weekly_statistics, only: :show
    end
  end
end
