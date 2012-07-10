Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :galleries do
    resources :galleries, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :galleries, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :galleries, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
