PopUp::Application.routes.draw do

  resources :widgets

    constraints(id: /[A-Za-z0-9-\*\%_=><,]+/ ) do
        resources :reports
    end
    resources :calendars
    resources :admins
    resources :contacts
    resources :updates
    
root :to => redirect('admins')
end
