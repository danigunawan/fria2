class LandingPageController < ApplicationController
	def index
		@announcements = Announcement.all
		@users = User.all
		@multiple_types = false
		@current_time = Time.now
		if current_user
			id = current_user.id
			@can_be_dean = current_user.dean.activated
			@can_be_admin = current_user.admin.activated
			@can_be_committee_member = current_user.committee_member.activated
			@can_be_committee_head = current_user.committee_head.activated
			@can_be_researcher = current_user.researcher.activated
	        @multiple_types = (@can_be_admin && @can_be_dean) || (@can_be_admin && @can_be_committee_member) || (@can_be_admin && @can_be_researcher) || (@can_be_researcher && @can_be_dean) || (@can_be_researcher && @can_be_committee_member) || (@can_be_committee_member && @can_be_dean)
			if @multiple_types
				current_user.curr_type = params[:curr_type]
			elsif @can_be_dean
				current_user.curr_type = 'Dean'
			elsif @can_be_researcher
				current_user.curr_type = 'Researcher'
			elsif @can_be_admin
				current_user.curr_type = 'Admin'
			elsif @can_be_committee_member
				current_user.curr_type = 'CommitteeMember'
			elsif @can_be_committee_head
				current_user.curr_type = 'CommitteeHead'
			else
				current_user.researcher.activated = true
			end
			# if current_user.curr_type == 'Admin'
			# 	render 'admins/index'
			# end
			current_user.save!
		end
	end

	def under_construction
	end
end
