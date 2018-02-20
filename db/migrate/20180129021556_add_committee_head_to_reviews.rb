class AddCommitteeHeadToReviews < ActiveRecord::Migration[5.1]
  def change
    add_reference :reviews, :committee_head, foreign_key: true
  end
end
