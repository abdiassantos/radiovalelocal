class AddColorToSocialNetworks < ActiveRecord::Migration[6.0]
  def change
    add_column :social_networks, :color, :string
  end
end
