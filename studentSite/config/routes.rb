StudentSite::Application.routes.draw do
    resources :admins    
root :to => redirect('admins')
end
