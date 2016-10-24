class AddContentToResumes < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :content, :text
  end
end
