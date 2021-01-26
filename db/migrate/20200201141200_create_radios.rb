class CreateRadios < ActiveRecord::Migration[6.0]
  def change
    create_table :radios do |t|
      t.string :title
      t.text :description
      t.string :link
      t.datetime :deleted_at

      t.timestamps
    end
  end
end
