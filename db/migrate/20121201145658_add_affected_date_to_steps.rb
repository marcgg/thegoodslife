class AddAffectedDateToSteps < ActiveRecord::Migration
  def change
    add_column :steps, :affected_date, :datetime
  end
end
