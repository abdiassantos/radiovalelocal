class AddKindToPages < ActiveRecord::Migration[6.0]
  def change
    add_column :pages, :kind, :integer, default: 0
  end
end
