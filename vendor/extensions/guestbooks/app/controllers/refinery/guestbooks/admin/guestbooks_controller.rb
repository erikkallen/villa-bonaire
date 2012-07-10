module Refinery
  module Guestbooks
    module Admin
      class GuestbooksController < ::Refinery::AdminController

        crudify :'refinery/guestbooks/guestbook',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
