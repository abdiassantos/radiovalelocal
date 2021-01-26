class CreateCounties < ActiveRecord::Migration[6.0]
  def change
    create_table :counties do |t|
      t.string :name
      t.string :slug
      t.integer :status, default: 0
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
