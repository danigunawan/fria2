class AddUserToCommitteeHeads < ActiveRecord::Migration[5.1]
  def change
    add_reference :committee_heads, :user, foreign_key: true
  end
end
