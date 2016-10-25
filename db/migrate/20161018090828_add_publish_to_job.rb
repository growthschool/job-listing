class AddPublishToJob < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :is_publish, :boolean, default: false
  end
end
