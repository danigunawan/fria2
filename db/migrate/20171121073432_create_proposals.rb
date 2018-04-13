class CreateProposals < ActiveRecord::Migration[5.1]
  def change
    create_table :proposals do |t|
      t.string :title
      t.string :researcher_name
      t.text :coresearchers
      t.text :objectives
      t.text :descriptions
      t.integer :status
      t.boolean :is_decided
      t.boolean :is_submitted

      t.timestamps
    end
  end
end
