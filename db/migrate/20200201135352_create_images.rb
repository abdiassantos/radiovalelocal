class CreateImages < ActiveRecord::Migration[6.0]
  def change
    create_table :images do |t|
      t.references :imageable, polymorphic: true, null: false
      t.string :subtitle
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
