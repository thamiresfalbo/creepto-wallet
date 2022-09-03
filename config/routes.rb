# frozen_string_literal: true

Rails.application.routes.draw do
  resources :mining_types
  root 'welcome#index'
  resources :coins
end
