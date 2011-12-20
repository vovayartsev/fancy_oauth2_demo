FancyOauth2Demo::Application.routes.draw do
  match "welcome/index"
  root :to => 'welcome#index'
end
