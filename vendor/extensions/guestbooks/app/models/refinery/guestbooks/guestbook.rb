module Refinery
  module Guestbooks
    class Guestbook < Refinery::Core::BaseModel
      self.table_name = 'refinery_guestbooks'      
    
      acts_as_indexed :fields => [:name, :message]

      validates :name, :presence => true
      validates :message, :presence => true
            
      default_scope :order => 'created_at DESC'
      self.per_page = 5
      
      def message2
        
      end
      
      def message2=(bla)
        
      end
    end
  end
end
