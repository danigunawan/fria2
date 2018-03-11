class SubmissionPeriod < ApplicationRecord
	belongs_to :proposals, optional: true
	after_initialize :set_defaults
	after_initialize :set_is_active_votation

	def set_defaults
		self.is_set = false if self.is_set.nil?
		self.is_active_votation = false if self.is_active_votation.nil?
	end

	def set_is_active_votation
		self.is_active_votation = true if Time.now >= self.start_votation and Time.now <= self.end_votation
	end
end