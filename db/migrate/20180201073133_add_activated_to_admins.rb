class AddActivatedToAdmins < ActiveRecord::Migration[5.1]
  def change
    add_column :admins, :activated, :boolean, :default => false
  end
end
