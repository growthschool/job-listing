class RenameJobColumns < ActiveRecord::Migration[5.0]
  def change
  	rename_column :jobs, :min_salary, :wage_lower_bound
  	rename_column :jobs, :max_salary, :wage_upper_bound
  	rename_column :jobs, :contact_info, :contact_email

  end
end
