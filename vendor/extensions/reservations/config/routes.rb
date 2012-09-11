Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :reservations do
    resources :reservations, :path => '', :only => [:new,:create] do
      get :thank_you, :on => :collection
    end
  end

  # Admin routes
  namespace :reservations, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :reservations, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
