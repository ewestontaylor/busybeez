class AddJobToApplicant < ActiveRecord::Migration[5.2]
  def change
    add_reference :applicants, :job, foreign_key: true
  end
end
