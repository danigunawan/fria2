class AddUserRefToCommitteeMembers < ActiveRecord::Migration[5.1]
  def change
    add_reference :committee_members, :user, foreign_key: true
  end
end
