class CreateCommitteeHeads < ActiveRecord::Migration[5.1]
  def change
    create_table :committee_heads do |t|

      t.timestamps
    end
  end
end
