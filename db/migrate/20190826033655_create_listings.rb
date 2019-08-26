class CreateListings < ActiveRecord::Migration[5.2]
  def change
    create_table :listings do |t|
      t.string :image
      t.string :title
      t.string :description
      t.string :price
      t.integer :rating
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
