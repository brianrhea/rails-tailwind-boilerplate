Rails.application.routes.draw do
  get "/:randomness", to: "home#index"
end
