PopUp::Application.routes.draw do

    constraints(id: /[A-Za-z0-9-\*\%_=><,]+/ ) do
        resources :reports
    end
    resources :calendars
    
root :to => redirect('calendars')
end