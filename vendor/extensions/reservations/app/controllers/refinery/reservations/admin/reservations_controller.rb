module Refinery
  module Reservations
    module Admin
      class ReservationsController < ::Refinery::AdminController

        crudify :'refinery/reservations/reservation',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
