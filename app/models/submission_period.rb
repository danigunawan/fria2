class SubmissionPeriod < ApplicationRecord
	belongs_to :proposals, optional: true
	after_initialize :set_defaults

	def set_defaults
		self.is_set = false if self.is_set.nil?
		self.is_active_votation = false if self.is_active_votation.nil?
	end
end