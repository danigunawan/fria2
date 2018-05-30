class AddIsWithdrawnToProposal < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :is_withdrawn, :boolean
  end
end
