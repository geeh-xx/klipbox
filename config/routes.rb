Rails.application.routes.draw do
  Klipbox::Application.routes.draw do
    resources :articles
    resources :users
    root :to => redirect('/articles')
    get 'search', to: 'search#search'
  end
end
