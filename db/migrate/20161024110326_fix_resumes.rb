class FixResumes < ActiveRecord::Migration[5.0]
  def change
    rename_column :resumes, :post_id, :user_id
  end
end
