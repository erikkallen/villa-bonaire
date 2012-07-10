module Refinery
  module Reservations
    class Reservation < Refinery::Core::BaseModel
      self.table_name = 'refinery_reservations'      
    
      acts_as_indexed :fields => [:name, :sirname, :address, :city, :email, :phonenumber]

      validates :name, :presence => true

      def full_name
      	"#{name.capitalize} #{sirname.capitalize}"
      end

      def time_period
      	"van #{startdate.to_s(:dutch)} tot #{enddate.to_s(:dutch)}"
      end
              
    end
  end
end
