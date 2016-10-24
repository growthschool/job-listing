class ChangeJobContentToDescription < ActiveRecord::Migration[5.0]
  def change
  	rename_column :jobs, :content, :description
  end
end
