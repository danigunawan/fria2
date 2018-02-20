class CreateDeans < ActiveRecord::Migration[5.1]
  def change
    create_table :deans do |t|

      t.timestamps
    end
  end
end
