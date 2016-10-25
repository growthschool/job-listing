class AddUserEmailContentToResume < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :content, :text 
    add_column :resumes, :user_email, :string
  end
end
