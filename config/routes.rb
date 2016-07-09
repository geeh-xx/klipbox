Rails.application.routes.draw do
  Klipbox::Application.routes.draw do
    resources :articles
    root :to => redirect('/articles')
    get 'search', to: 'search#search'
  end
end
