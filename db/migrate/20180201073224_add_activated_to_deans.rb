class AddActivatedToDeans < ActiveRecord::Migration[5.1]
  def change
    add_column :deans, :activated, :boolean, :default => false
  end
end
