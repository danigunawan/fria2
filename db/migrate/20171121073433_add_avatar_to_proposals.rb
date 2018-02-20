class AddAvatarToProposals < ActiveRecord::Migration[5.1]
  def change
    add_column :proposals, :avatar, :string
  end
end
