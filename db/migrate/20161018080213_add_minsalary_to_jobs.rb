class AddMinsalaryToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :minsalary, :integer
  end
end
