Rails.application.routes.draw do
  Klipbox::Application.routes.draw do
    resources :articles
  end
  root :to => redirect('/articles')
end
