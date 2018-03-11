class CreateSubmissionPeriods < ActiveRecord::Migration[5.1]
  def change
    create_table :submission_periods do |t|

      t.datetime :start_votation
      t.datetime :end_votation

      t.timestamps
    end
  end
end
