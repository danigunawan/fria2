class CreateResearchers < ActiveRecord::Migration[5.1]
  def change
    create_table :researchers do |t|

      t.timestamps
    end
  end
end
