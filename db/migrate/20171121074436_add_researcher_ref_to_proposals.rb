class AddResearcherRefToProposals < ActiveRecord::Migration[5.1]
  def change
    add_reference :proposals, :researcher, foreign_key: true
  end
end
