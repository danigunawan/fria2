class Comment < ApplicationRecord
	validates :comment, presence: true
	
	belongs_to :proposal, optional: true
	belongs_to :committee_member, optional: true
	belongs_to :committee_head, optional: true
	belongs_to :dean, optional: true
	after_initialize :set_defaults

	def set_defaults
		self.comment ||= ''
	end
end
