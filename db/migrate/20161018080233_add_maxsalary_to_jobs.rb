class AddMaxsalaryToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :maxsalary, :integer
  end
end
