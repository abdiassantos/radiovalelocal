class CreateBannerCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :banner_categories do |t|
      t.string :name
      t.string :width
      t.string :height
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
