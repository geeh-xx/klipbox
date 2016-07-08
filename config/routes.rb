Rails.application.routes.draw do
  Klipbox::Application.routes.draw do
    resources :articles
  end
end
