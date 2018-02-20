class Researcher < ApplicationRecord
	after_initialize :set_defaults
	belongs_to :user, optional: true
	has_many :proposals
	def set_defaults
	  	self.activated = true if self.activated.nil?
	end
end
