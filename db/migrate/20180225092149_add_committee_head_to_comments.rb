class AddCommitteeHeadToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :committee_head, foreign_key: true
  end
end
