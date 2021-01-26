class CreateBlogs < ActiveRecord::Migration[6.0]
  def change
    create_table :blogs do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :county_id
      t.string :name
      t.text :role
      t.integer :status, default: 0
      t.integer :kind, default: 0
      t.string :slug
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
