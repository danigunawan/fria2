class ReviewsController < ApplicationController
	def index
		@proposal = Proposal.find(params[:id])
		@reviews = @proposal.reviews
		authorize! :index, Review
		@my_review = nil
		if current_user.curr_type == 'CommitteeMember'
			@my_review = Review.where(proposal_id: @proposal).where(committee_member_id: current_user.committee_member.id).take
		elsif current_user.curr_type == 'CommitteeHead'
			@my_review = Review.where(proposal_id: @proposal).where(committee_head_id: current_user.committee_head.id).take
		else
			@my_review = nil
		end

		@canvote = false
		if Time.now < @proposal.submission_period.start_votation
			@canvote = true
		end

	end

	def new
		authorize! :new, Review
		@proposal = Proposal.find(params[:id])
		@review = Review.new
		session[:passed_variable] = @proposal.id
	end

	def create
		authorize! :create, Review
		@review = Review.new(review_params)
		@review.proposal_id = session[:passed_variable]
		if current_user.curr_type == 'CommitteeMember'
			@review.committee_member_id = current_user.committee_member.id
		elsif current_user.curr_type == 'CommitteeHead'
			@review.committee_head_id = current_user.committee_head.id
		end
		if @review.save
			redirect_to reviews_page_path(session[:passed_variable])
		end
	end

	def edit
		@review = Review.find(params[:reviewid])
		authorize! :edit, @review
		@proposal = Proposal.find(params[:proposalid])
		session[:proposal] = @proposal.id
		# session[:passed_variable2] = @review.id
	end

	def update
		# num =  session[:passed_variable2]
		# @review = Review.find(num)
		@review = Review.find(params[:id])
		authorize! :update, @review
		if @review.update(review_params)
			@review.is_decided = true
			@review.save!
			# redirect_to reviews_page_path(session[:passed_variable])
			redirect_to reviews_page_path(session[:proposal])
		else
			render 'edit'
		end
	end


	private 

	def review_params
      params.require(:review).permit(:comment,:vote)		
	end
end
