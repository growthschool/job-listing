class CreateResumes < ActiveRecord::Migration[5.0]
  def change
    create_table :resumes do |t|
      t.integer :post_id
      t.integer :job_id
      t.string :attachment

      t.timestamps
    end
  end
end
