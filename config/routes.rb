Rails.application.routes.draw do

	post '/contacts/cookie', to: 'contacts#cookie', :defaults => { :format => 'json' }
  resources :contacts
  root to: 'application#index'

end
