class CommitteeMember < ApplicationRecord
	after_initialize :set_defaults
	belongs_to :user, optional: true
	has_many :reviews
	has_many :proposals, through: :reviews
	has_many :comments
	
	def set_defaults
	  	self.activated = false if self.activated.nil?
	end
end
