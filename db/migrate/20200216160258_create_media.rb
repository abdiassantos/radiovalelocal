class CreateMedia < ActiveRecord::Migration[6.0]
  def change
    create_table :media do |t|
      t.integer :kind, default: 0
      t.string :link

      t.timestamps
    end
  end
end
