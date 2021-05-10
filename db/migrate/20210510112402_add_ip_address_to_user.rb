class AddIpAddressToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :ip_address, :float
  end
end
