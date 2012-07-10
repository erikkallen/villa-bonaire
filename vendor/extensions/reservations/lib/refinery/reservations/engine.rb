module Refinery
  module Reservations
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Reservations

      engine_name :refinery_reservations

      initializer "register refinerycms_reservations plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "reservations"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.reservations_admin_reservations_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/reservations/reservation',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Reservations)
      end
    end
  end
end
