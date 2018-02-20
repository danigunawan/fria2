class AddProposalRefToSubmissionPeriods < ActiveRecord::Migration[5.1]
  def change
    add_reference :submission_periods, :proposal, foreign_key: true
  end
end
