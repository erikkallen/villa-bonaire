require 'picasa'
module Refinery
  module Galleries
    class PhotoAlbum
		@@user = "edeuxk"

     	def self.all
     		Picasa.albums(:google_user => @@user).collect{|a|Hashit.new a}
     	end

     	def self.method_missing(method_id, *arguments)
		  if match = /find_(all_by|by)_([_a-zA-Z]\w*)/.match(method_id.to_s)
		    # find...
		    puts arguments
		  	#all.collect{|a|a if a.send($2.to_sym) == arguments.first.to_s}.compact.first
		  	all.select{|a|a.send($2.to_sym) == arguments.first.to_s}.first
		  else
		    super
		  end
		end

		def self.user
			@@user
		end

		def self.user=(user)
			@@user = user
			
		end

		

		class Hashit
		  def initialize(hash)
		    hash.each do |k,v|
		      self.instance_variable_set("@#{k}", v)
		      self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
		      self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})
		    end
		  end
		  
		  def photos
			Picasa.photos(:google_user => PhotoAlbum.user, :album_id => id)[:photos].collect{|p|Hashit.new p}
		  end

		  def to_param
		  	id
		  end

		  def save
		    hash_to_return = {}
		    self.instance_variables.each do |var|
		      hash_to_return[var.gsub("@","")] = self.instance_variable_get(var)
		    end
		    return hash_to_return
		  end
		end
              
    end
  end
end