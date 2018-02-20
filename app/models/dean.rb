class Dean < ApplicationRecord
	after_initialize :set_defaults
	belongs_to :user, optional: true
	def set_defaults
	  	self.activated = false if self.activated.nil?
	end
end
