class Proposal < ApplicationRecord
	validates :title, presence: true
	validates :researcher, presence: true

	belongs_to :researcher, optional: true
	after_initialize :set_defaults
	has_one :submission_period, dependent: :destroy
	has_many :reviews, dependent: :destroy
	has_many :committee_members, through: :reviews
	has_many :committee_heads, through: :reviews
	has_many :comments

	mount_uploader :avatar, AvatarUploader
	def set_defaults
	    self.title  ||= ''
	    self.researcher_name ||= ''
	    self.coresearchers ||= ''
	    self.objectives ||= ''
	    self.status ||= -1
	    self.votes ||= 0
	    self.is_vetoed = false if self.is_vetoed.nil?
	 	self.is_decided = false if self.is_decided.nil?
	 	self.is_assigned_reviewers = false if self.is_assigned_reviewers.nil?
	 	self.is_submitted = false if self.is_submitted.nil?
	 	self.create_submission_period!() if self.submission_period.nil?
	 	self.is_submitted = self.avatar.nil? ? false : true
	 end
end
