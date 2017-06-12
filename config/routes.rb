Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  namespace :api do
    namespace :v1 do
        get :questions, to: 'questions#show', via: [:options]

    end
  end
end
