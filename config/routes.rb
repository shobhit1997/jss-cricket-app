Rails.application.routes.draw do
	namespace 'api' do
		namespace 'v1' do
			resources :users
			resources :matches
			get 'users/performance/:id', to: 'users#performance'
			post 'users/batting'
			post 'users/bowling'
			post 'admins/login', to: 'authentication#authenticate'
			resources :tournaments
			resources :admins
		end
	end
end
