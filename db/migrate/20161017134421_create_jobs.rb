class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :content
      t.integer :min_salary
      t.integer :max_salary
      t.string :contact_info

      t.timestamps
    end
  end
end
