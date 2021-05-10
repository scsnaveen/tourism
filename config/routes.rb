Rails.application.routes.draw do
	devise_for :users, controllers: { 
		registrations: 'users/registrations', 
		sessions: 'users/sessions'
	}
	get 'welcome/index'
	root 'welcome#index'
	# get 'users/show'
	# get 'users/edit'
	put 'users/update_profile_pic'
	get 'users/update_profile_pic'
	resources :users do
		member do
			get :secure_image
		end
	end
	get 'countries/new'
	post 'countries/create'
	get 'places/new'
	post 'places/create'
	get 'places/index'
	get 'places/distance'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
