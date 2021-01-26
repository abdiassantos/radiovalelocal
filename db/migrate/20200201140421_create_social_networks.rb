class CreateSocialNetworks < ActiveRecord::Migration[6.0]
  def change
    create_table :social_networks do |t|
      t.string :name
      t.string :description
      t.string :link
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
