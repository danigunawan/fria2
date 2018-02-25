class AddCommitteeMemberToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :committee_member, foreign_key: true
  end
end