class Admin < ApplicationRecord
	belongs_to :user, optional: true
	after_initialize :set_defaults
	def set_defaults
	  	self.activated = false if self.activated.nil?
	end
end
