class CreateCoresearchers < ActiveRecord::Migration[5.1]
  def change
    create_table :coresearchers do |t|
      t.string :first_name
      t.string :last_name
      t.string :affiliation

      t.timestamps
    end
  end
end
