class ProposalsController < ApplicationController
	def new
		@proposal = Proposal.new
		authorize! :new, @proposal
	end

	def create
		@proposal = Proposal.new(proposal_params)
		authorize! :create, @proposal
		@proposal.researcher_id = current_user.id

		if @proposal.save
			redirect_to proposals_page_path
		end
	end

	def index
		authorize! :index, Proposal
		@proposals = []
		if current_user
			if current_user.curr_type == 'CommitteeMember'
				@proposals += current_user.committee_member.proposals
			elsif current_user.curr_type == 'CommitteeHead'
				@proposals += current_user.committee_head.proposals
			else
				@proposals = Proposal.accessible_by(current_ability).order('id DESC')
			end
		end


	end

	def show
		@proposal = Proposal.find(params[:id])
		authorize! :read, @proposal

	end

	def edit
		@proposal = Proposal.find(params[:id])
		authorize! :edit, @proposal
	end

	def update
		@proposal = Proposal.find(params[:id])
		authorize! :update, @proposal
		if @proposal.update(proposal_params)
			redirect_to proposals_page_path
		else
			render 'edit'
		end
	end

	def destroy
		@proposal = Proposal.find(params[:id])
		authorize! :destroy, @proposal
    	@proposal.destroy
    	redirect_to proposals_page_path
	end

	def veto
		@proposal = Proposal.find(params[:id])
		@reviews = @proposal.reviews
		authorize! :veto, @proposal
		@reviews.each do |review|
			if review.committee_member_id.nil?
				@headreview = review
			end
		end
		@proposal.save!
	end

	def vetoed
		@proposal = Proposal.find(params[:id])
		s = "/proposals/"
		s << params[:id].to_s
		s << "/veto"
		if params[s][:vote] == '0'
			@proposal.submission_period.start_votation = nil
			@proposal.submission_period.end_votation = nil
			@proposal.submission_period.is_set = false
			@proposal.submission_period.is_active_votation = false
		else
			@proposal.status = params[s][:vote]
			@proposal.is_decided = 1
		end
		@proposal.submission_period.save!
		@proposal.save!
		redirect_to proposals_page_path
	end

	def uphold
		@proposal = Proposal.find(params[:id])
		@reviews = @proposal.reviews
		@reviews.each do |review|
			if review.committee_member_id.nil?
				if review.vote == 0
					proposal.submission_period.start_votation = nil
					@proposal.submission_period.end_votation = nil
					@proposal.submission_period.is_set = false
				else
					@proposal.status = review.vote
					@proposal.is_decided = 1
				end
			end
		end
		@proposal.submission_period.save!
		@proposal.save!

		redirect_to reviews_page_path
	end

	def assign
		@proposal = Proposal.find(params[:id])
		authorize! :assign, @proposal
		@heads = []
		@reviewers = []
		committee_heads = CommitteeHead.where(activated: true)
		committee_members = CommitteeMember.where(activated: true)
		if !committee_heads.empty?
			committee_heads.each do |committee_head|
				if committee_head.proposals.include? @proposal
					@heads.append(committee_head)
				end
			end
		end

		if !committee_members.empty?
			committee_members.each do |committee_member|
				if committee_member.proposals.include? @proposal
					@reviewers.append(committee_member)
				end
			end
		end
		if @heads
			@possible_heads = committee_heads - @heads
		else
			@possible_heads = committee_heads
		end

		if @reviewers
			@possible_reviewers = committee_members - @reviewers
		else
			@possible_reviewers = committee_members
		end
	end

	def assign_head_to_proposal
		@proposal = Proposal.find(params[:proposalid])
		authorize! :assign, @proposal
		@reviewer = CommitteeHead.find(params[:memberid])
		review = Review.where('proposal_id = ? and committee_head = ?', @proposal.id, @reviewer.id)
		@reviewer.proposals.append(@proposal)
		if @proposal.committee_members.length == 2 and @proposal.committee_heads.length == 1
			@proposal.is_assigned_reviewers = true
		end
		@proposal.save!
		redirect_to assign_proposal_path
	end

	def assign_member_to_proposal
		@proposal = Proposal.find(params[:proposalid])
		authorize! :assign, @proposal
		@reviewer = CommitteeMember.find(params[:memberid])
		@reviewer.proposals.append(@proposal)
		if @proposal.committee_members.length == 2 and @proposal.committee_heads.length == 1
			@proposal.is_assigned_reviewers = true
		end
		@proposal.save!
		redirect_to assign_proposal_path
	end

	def remove_head_from_proposal
		@proposal = Proposal.find(params[:proposalid])
		authorize! :assign, @proposal
		@reviewer = CommitteeHead.find(params[:memberid])
		@reviewer.proposals.delete(@proposal)
		if @proposal.committee_members.length != 2 or @proposal.committee_heads.length != 1
			@proposal.is_assigned_reviewers = false
		end
		@proposal.save!
		redirect_to assign_proposal_path
	end

	def remove_member_from_proposal
		@proposal = Proposal.find(params[:proposalid])
		authorize! :assign, Proposal
		@reviewer = CommitteeMember.find(params[:memberid])
		@reviewer.proposals.delete(@proposal)
		if @proposal.committee_members.length != 2 or @proposal.committee_heads.length != 1
			@proposal.is_assigned_reviewers = false
		end
		@proposal.save!
		redirect_to assign_proposal_path
	end

	def edit_submission_period
		@proposal = Proposal.find(params[:id])
		authorize! :edit, SubmissionPeriod
	end

	def edit_period
		@proposal = Proposal.find(params[:id])
		@proposal.submission_period.is_set = true
		s = "/proposals/"
		s << params[:id].to_s
		s << "/editsubmissionperiod"
		@proposal.submission_period.start_votation = params[s][:start]
		@proposal.submission_period.end_votation = params[s][:deadline]
		@proposal.submission_period.save!
		@proposal.save!
		

		redirect_to proposals_page_path
	end

	def update_submission_period
		@proposal = Proposal.find(params[:id])
		authorize! :update, @proposal
		if @proposal.update_submission_period(proposal_params)
			redirect_to proposals_page_path
		else
			render 'edit_submission_period'
		end
	end

	private def proposal_params
     	params.require(:proposal).permit(:title, :objectives, :descriptions, :coresearchers, :researcher_name, :avatar)
    end

    private def submission_period_params
     	params.require(:proposal).permit(:title, :researcher_name, :avatar)
    end
end
