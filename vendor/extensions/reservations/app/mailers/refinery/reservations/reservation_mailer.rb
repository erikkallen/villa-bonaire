module Refinery
  module Reservations
    class ReservationMailer < ActionMailer::Base

      def confirmation(reservation, request)
        @reservation = reservation
        mail :subject   => Refinery::Reservations::Setting.confirmation_subject(Globalize.locale),
             :to        => reservation.email,
             :from      => "\"#{Refinery::Core.site_name}\" <villabonaire@gmail.com>",
             :reply_to  => Refinery::Reservations::Setting.notification_recipients.split(',').first
      end

      def notification(reservation, request)
        @reservation = reservation
        mail :subject   => Refinery::Reservations::Setting.notification_subject,
             :to        => Refinery::Reservations::Setting.notification_recipients,
             :from      => "\"#{Refinery::Core.site_name}\" <villabonaire@gmail.com>",
             :reply_to  => reservation.email
      end

    end
  end
end