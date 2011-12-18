FancyOauth2Demo::Application.routes.draw do
  match "fancy_oauth2/callback"
  match "welcome/index"
  root :to => 'welcome#index'
end
