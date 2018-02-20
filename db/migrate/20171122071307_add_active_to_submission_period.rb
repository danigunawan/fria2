class AddActiveToSubmissionPeriod < ActiveRecord::Migration[5.1]
  def change
  	add_column :submission_periods, :is_set, :boolean
    add_column :submission_periods, :is_active_draft, :boolean
	add_column :submission_periods, :is_active_votation, :boolean
  end
end
