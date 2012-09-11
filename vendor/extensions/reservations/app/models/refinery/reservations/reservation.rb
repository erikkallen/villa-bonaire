module Refinery
  module Reservations
    class Reservation < Refinery::Core::BaseModel
      self.table_name = 'refinery_reservations'      
    
      acts_as_indexed :fields => [:name, :sirname, :address, :city, :email, :phonenumber]
      attr_accessible :name, :sirname, :address, :city, :email, :phonenumber, :startdate,:enddate

      validates :name, :presence => true
      validates_presence_of :name, :sirname,:email,:address, :city, :phonenumber, :startdate, :enddate
      validates :email, :format=> { :with =>  /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }
      #validates_date :startdate, :enddate

      def full_name
      	"#{name.capitalize} #{sirname.capitalize}"
      end

      def time_period
      	"van #{startdate.to_s(:dutch)} tot #{enddate.to_s(:dutch)}" unless startdate.nil? || enddate.nil?
      end
              
    end
  end
end
