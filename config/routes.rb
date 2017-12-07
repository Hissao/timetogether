Rails.application.routes.draw do
  get 'matcher/new'
  get 'matcher/show'

  root 'matcher#new'
end
