class AddAdminIdToList < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :admin_id, :integer

  end
end
