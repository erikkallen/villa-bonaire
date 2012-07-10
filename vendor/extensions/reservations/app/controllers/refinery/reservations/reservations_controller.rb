module Refinery
  module Reservations
    class ReservationsController < ::ApplicationController

      before_filter :find_all_reservations
      before_filter :find_page

      def new
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @reservation in the line below:
        @reservation = Reservation.new
        present(@page)
      end

      def create
        @reservation = Reservation.new(params[:reservation])

        if @reservation.save

          redirect_to refinery.new_reservations_reservation_path
        else
          render :action => 'new'
        end
      end

    protected

      def find_all_reservations
        @reservations = Reservation.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/reservations/new").first
      end

    end
  end
end
