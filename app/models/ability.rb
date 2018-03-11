class Ability
  include CanCan::Ability
  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
    if user
      if user.curr_type == 'Researcher'
        can :index, Proposal, researcher_id: user.researcher.id
        can :read, Proposal, researcher_id: user.researcher.id
        can :create, Proposal
        can :new, Proposal
        can :edit, Proposal, researcher_id: user.researcher.id, is_decided: false 
        can :update, Proposal, researcher_id: user.researcher.id, is_decided: false
        can :destroy, Proposal, researcher_id: user.researcher.id, is_decided: false
      elsif user.curr_type == 'CommitteeMember'
        can :index, Proposal, is_submitted: true
        can :read, Proposal, is_submitted: true
        can :review, Proposal, is_submitted: true

        can :edit, Review, committee_member_id: user.committee_member.id
        can :update, Review, committee_member_id: user.committee_member.id
        can :index, Review, committee_member_id: user.committee_member.id
        can :read, Review, committee_member_id: user.committee_member.id
      elsif user.curr_type == 'CommitteeHead'
        can :index, Proposal, is_submitted: true
        can :read, Proposal, is_submitted: true
        can :review, Proposal, is_submitted: true

        can :edit, Review, committee_head_id: user.committee_head.id
        can :update, Review, committee_head_id: user.committee_head.id
        can :index, Review, committee_head_id: user.committee_head.id
        can :read, Review, committee_head_id: user.committee_head.id

        can :update, SubmissionPeriod
        can :edit, SubmissionPeriod
      elsif user.curr_type == 'Dean'
        can :index, Proposal
        can :read, Proposal
        can :index, Review
        can :read, Review
        can :review, Proposal
        can :veto, Proposal, is_decided: false
      elsif user.curr_type == 'Admin'
        can :index, User
        can :show, User
        can :activate, User
        can :deactivate, User
        can :manage, Review
        can :index, Proposal
        can :read, Proposal
        can :assign, Proposal
        can :manage, Announcement
      end
    end
  end
end
