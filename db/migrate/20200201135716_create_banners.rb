class CreateBanners < ActiveRecord::Migration[6.0]
  def change
    create_table :banners do |t|
      t.references :bannerable, polymorphic: true, null: false
      t.references :banner_category, null: false, foreign_key: true
      t.text :description
      t.datetime :start_at
      t.datetime :finish_at
      t.string :link
      t.integer :priority
      t.boolean :target
      t.integer :status
      t.integer :delayer
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
