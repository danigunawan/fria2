class AddCommitteeMemberRefToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :committee_member, foreign_key: true
  end
end
