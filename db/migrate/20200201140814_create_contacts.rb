class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :email
      t.text :message
      t.string :city
      t.string :state
      t.string :phone
      t.datetime :deleted_at
      
      t.timestamps
    end
  end
end
