class Review < ApplicationRecord
	belongs_to :proposal, optional: true
	belongs_to :committee_member, optional: true
	belongs_to :committee_head, optional: true
	after_initialize :set_defaults

	def set_defaults
		self.vote ||= -1
		self.is_decided = false if self.is_decided.nil?
	end
end
