class CopyDealsCreatedAtToAffectedAt < ActiveRecord::Migration
  def up
    Step.where(affected_date: nil).each do |step|
      step.affected_date = step.created_at
      step.save
    end
  end
end
