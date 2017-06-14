Rails.application.routes.draw do
  ActiveAdmin.routes(self)

  root 'quiz#start'

  get "quiz/letsplay"
  post "quiz/validate"
  get "quiz/finish"

  namespace :api do
    namespace :v1 do
        get :questions, to: 'questions#show', via: [:options]
    end
  end
end
