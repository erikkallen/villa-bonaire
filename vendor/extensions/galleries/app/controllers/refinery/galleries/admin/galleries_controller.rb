module Refinery
  module Galleries
    module Admin
      class GalleriesController < ::Refinery::AdminController

        crudify :'refinery/galleries/gallery',
                :title_attribute => 'name', :xhr_paging => false

        def index
        	@galleries = ::Refinery::Galleries::Gallery.all
        end

      end
    end
  end
end
