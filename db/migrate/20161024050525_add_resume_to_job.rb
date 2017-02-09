class AddResumeToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :resume, :string
  end
end
