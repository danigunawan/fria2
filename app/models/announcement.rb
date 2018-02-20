class Announcement < ApplicationRecord
	after_initialize :set_defaults
	validates :title, presence: true
	validates :body, presence: true 

	def set_defaults
		self.title ||= ''
		self.body ||= ''
	end
end
