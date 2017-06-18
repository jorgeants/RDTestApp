Rails.application.routes.draw do

	post '/contacts/cookie', to: 'contacts#cookie', defaults: { format: 'json' }
	post '/contacts/access', to: 'contacts#access', defaults: { format: 'json' }
	post '/contacts/save-contact', to: 'contacts#save_contact', defaults: { format: 'json' }
	resources :contacts, except: [:new, :create, :edit]
	root to: 'application#index'

end
