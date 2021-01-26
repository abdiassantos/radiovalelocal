class CreatePages < ActiveRecord::Migration[6.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :content
      t.integer :status, default: 0
      t.string :slug
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
