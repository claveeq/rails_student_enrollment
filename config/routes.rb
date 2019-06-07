Rails.application.routes.draw do
  resources :students do
    member do
      post :enroll
    end
  end

  resources :courses, only: [:index]
  
  resources :enrollments, only: [:create, :destroy]
end
