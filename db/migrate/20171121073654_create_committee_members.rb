class CreateCommitteeMembers < ActiveRecord::Migration[5.1]
  def change
    create_table :committee_members do |t|
    	
      t.timestamps
    end
  end
end
