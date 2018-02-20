class AddActivatedToCommitteeHeads < ActiveRecord::Migration[5.1]
  def change
    add_column :committee_heads, :activated, :boolean, :default => false
  end
end
