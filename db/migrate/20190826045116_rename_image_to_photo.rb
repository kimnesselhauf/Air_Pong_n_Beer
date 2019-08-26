class RenameImageToPhoto < ActiveRecord::Migration[5.2]
  def change
    rename_column :listings, :image, :photo
  end
end
