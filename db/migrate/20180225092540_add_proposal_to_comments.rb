class AddProposalToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :proposal, foreign_key: true
  end
end
