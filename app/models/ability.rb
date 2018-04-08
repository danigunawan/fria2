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
        can [:index, :read], Proposal, researcher_id: user.researcher.id
        can [:create, :new], Proposal
        can [:edit, :update, :destroy], Proposal do |proposal|
          proposal.researcher_id == user.researcher.id
          proposal.is_decided == false
          proposal.submission_period.is_active_votation == false
          proposal.status < 1
        end
      elsif user.curr_type == 'CommitteeMember'
        can [:index, :read, :comment], Proposal
        can :review, Proposal do |proposal|
          proposal.status == 0 or proposal.status == 1
        end
        can [:edit, :update, :index, :read], Review, committee_member_id: user.committee_member.id
      elsif user.curr_type == 'CommitteeHead'
        can [:index, :read, :comment], Proposal
        can :review, Proposal do |proposal|
          proposal.status == 0 or proposal.status == 1
        end
        can [:edit, :update, :index, :read], Review, committee_head_id: user.committee_head.id
        can [:update, :edit], SubmissionPeriod
      elsif user.curr_type == 'Dean'
        can [:index, :read, :comment], Proposal
        can :review, Proposal do |proposal|
          proposal.status == 0 or proposal.status == 1
        end
        can :veto, Proposal do |proposal|
          proposal.is_decided == false or proposal.status == 2 or proposal.status == 3
        end
        can [:index, :read], Review do |proposal|
          prposal.status == 0 or proposal.status == 1
        end
      elsif user.curr_type == 'Admin'
        can [:index, :show, :activate, :deactivate], User
        can [:index, :read, :assign], Proposal
        can :manage, Review
        can :manage, Announcement
      end
    end
  end
end
