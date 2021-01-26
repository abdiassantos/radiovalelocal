class CreateGalleries < ActiveRecord::Migration[6.0]
  def change
    create_table :galleries do |t|
      t.string :name
      t.string :slug
      t.text :description
      t.integer :status, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
