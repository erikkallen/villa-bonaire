module Refinery
  module Guestbooks
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Guestbooks

      engine_name :refinery_guestbooks

      initializer "register refinerycms_guestbooks plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "guestbooks"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.guestbooks_admin_guestbooks_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/guestbooks/guestbook',
            :title => 'name'
          }
          
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Guestbooks)
      end
    end
  end
end
