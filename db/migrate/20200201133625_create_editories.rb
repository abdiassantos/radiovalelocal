class CreateEditories < ActiveRecord::Migration[6.0]
  def change
    create_table :editories do |t|
      t.string :name
      t.string :slug
      t.integer :status, default: 0
      t.integer :priority, default: 0
      t.boolean :menu, default: false
      t.datetime :deleted_at, index: true

      t.timestamps
    end
  end
end
