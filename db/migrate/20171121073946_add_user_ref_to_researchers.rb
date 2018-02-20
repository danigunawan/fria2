class AddUserRefToResearchers < ActiveRecord::Migration[5.1]
  def change
    add_reference :researchers, :user, foreign_key: true
  end
end
