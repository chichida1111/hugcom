Rails.application.routes.draw do
  
  root to: "contacts#index"

  devise_for :parent_users, controllers: {
    sessions: 'parent_users/sessions',
    registrations: 'parent_users/registrations'
  }

  devise_for :teacher_users, controllers: {
    sessions: 'teacher_users/sessions',
    registrations: 'teacher_users/registrations'
  }

  resources :contacts do
    resources :parent_messages, only: [:create, :edit, :update, :destroy ]
  end

  post '/contacts/:id', to: 'parent_messages#create'

  resources :contacts do
    resources :teacher_messages, only: [:create, :edit, :update, :destroy ]
  end

  post '/contacts/:id', to: 'teacher_messages#create'

end
