class AddIsAssignedReviewersToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :is_assigned_reviewers, :boolean
  end
end
