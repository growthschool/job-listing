class AddAvatarToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :avatar, :string
  end
  mount_uploaders :avatars, AvatarUploader

end
