class AddActivatedToResearchers < ActiveRecord::Migration[5.1]
  def change
    add_column :researchers, :activated, :boolean, :default => false
  end
end
