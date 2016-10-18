class CreateListRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :list_relationships do |t|
      t.string :list_id
      t.integer :user_id

      t.timestamps
    end
  end
end
