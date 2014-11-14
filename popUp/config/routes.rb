PopUp::Application.routes.draw do
    resources :reports
    resources :calendars
    
root :to => redirect('calendars')
end