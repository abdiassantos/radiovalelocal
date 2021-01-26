class AddKindToBanner < ActiveRecord::Migration[6.0]
  def change
    add_column :banners, :kind, :integer
  end
end
