module Refinery
  module Reservations
    class ReservationsController < ::ApplicationController

      before_filter :find_all_reservations
      before_filter :find_page, exept: :thank_you

      def new
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @reservation in the line below:
        @reservation = Reservation.new
        present(@page)
      end

      def thank_you
        @page = ::Refinery::Page.find_by_link_url("/reservations/thank_you")
        #binding.pry
        present(@page)
        render text: "Bedankt voor uw reservering", layout: "application"
      end

      def create
        @reservation = Reservation.new(params[:reservation])

        if @reservation.save
          begin
              ReservationMailer.notification(@reservation, request).deliver
            rescue
              logger.warn "There was an error delivering an inquiry notification.\n#{$!}\n"
            end

            begin
              ReservationMailer.confirmation(@reservation, request).deliver
            rescue
              logger.warn "There was an error delivering an inquiry confirmation:\n#{$!}\n"
            end
          redirect_to refinery.thank_you_reservations_reservations_path
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
