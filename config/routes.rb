# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  root to: "courses#index"

  get "/courses/:id", to: "courses#show", as: :course
  get "/courses/:id/groups/:group_id/join", to: "courses#join", as: :join_group
  post "/courses/:id/groups/:group_id/join", to: "courses#join"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
