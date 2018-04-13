class Proposal < ApplicationRecord
	validates :title, presence: true
	validates :researcher, presence: true
	validates :descriptions, presence: true
	validates :avatar, presence: true

	belongs_to :researcher, optional: true
	after_initialize :set_defaults
	after_initialize :set_status
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
	    # self.votes ||= 0
	    # self.is_vetoed = false if self.is_vetoed.nil?
	 	self.is_decided = false if self.is_decided.nil?
	 	self.is_assigned_reviewers = true if self.reviews.length == 3
	 	self.is_submitted = false if self.is_submitted.nil?
	 	self.create_submission_period!(proposal_id: self.id) if self.submission_period.nil?
	 	self.is_submitted = self.avatar.nil? ? false : true
	 end

	 def set_status
 		self.status = 1 if self.submission_period.is_active_votation
 		self.status = 0 if !self.submission_period.is_set
 		self.status = -1 if self.reviews.length == 3
 		self.is_decided = true if self.status > 0
	 end
end
