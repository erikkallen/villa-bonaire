module Refinery
  module Galleries
    class Gallery < Refinery::Core::BaseModel
      self.table_name = 'refinery_galleries'      
    
      acts_as_indexed :fields => [:name]

      validates :name, :presence => true, :uniqueness => true
              
    end
  end
end
