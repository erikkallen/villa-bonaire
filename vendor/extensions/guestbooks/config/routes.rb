Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :guestbooks do
    resources :guestbooks, :path => '', :only => [:index, :show,:new,:create]
  end

  # Admin routes
  namespace :guestbooks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :guestbooks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
