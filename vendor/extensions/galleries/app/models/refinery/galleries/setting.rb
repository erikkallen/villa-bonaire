module Refinery
  module Galleries
    class Setting

      class << self
        def username
          Refinery::Setting.find_or_set(:gallery_username,
            "villabonaire", :scoping => :galleries
          )
        end
      end
    end
  end
end