class AddDeanToComments < ActiveRecord::Migration[5.1]
  def change
    add_reference :comments, :dean, foreign_key: true
  end
end
