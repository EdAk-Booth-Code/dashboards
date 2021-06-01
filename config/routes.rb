Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  get("/", {:controller => "application", :action => "show_methods"})

  get("/forex", {:controller => "forex", :action => "test"})

  get("/forex/:symbol", {:controller => "forex", :action => "second_currency"})

  get("/forex/:symbol_1/:symbol_2", {:controller => "forex", :action => "currency_converter"})
end
