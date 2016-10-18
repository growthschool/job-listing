class AddDefaultValueToIsHidden < ActiveRecord::Migration[5.0]
  def change
    change_column :jobs, :is_hidden, :boolean, :default => false
  end
end
