class AddActivatedToCommitteeMembers < ActiveRecord::Migration[5.1]
  def change
    add_column :committee_members, :activated, :boolean, :default => false
  end
end
