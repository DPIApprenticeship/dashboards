Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get("/", { :controller => "application", :action => "dashboard"})

  get("/forex", { :controller => "forex", :action => "index" })
  get("/forex/:first_currency", { :controller => "forex", :action => "first_currency"})
  get("/forex/:first_currency/:second_currency", { :controller => "forex", :action => "exchange"})
end
