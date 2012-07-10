require 'refinerycms-core'

module Refinery
  autoload :ReservationsGenerator, 'generators/refinery/reservations_generator'

  module Reservations
    require 'refinery/reservations/engine'

    class << self
      attr_writer :root

      def root
        @root ||= Pathname.new(File.expand_path('../../../', __FILE__))
      end

      def factory_paths
        @factory_paths ||= [ root.join('spec', 'factories').to_s ]
      end
    end
  end
end
