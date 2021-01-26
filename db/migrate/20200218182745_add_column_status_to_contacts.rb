class AddColumnStatusToContacts < ActiveRecord::Migration[6.0]
  def change
    add_column :contacts, :status, :integer, default: 0
  end
end
