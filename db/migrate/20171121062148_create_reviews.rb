class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :comment
      t.integer :vote
      t.boolean :is_decided

      t.timestamps
    end
  end
end
