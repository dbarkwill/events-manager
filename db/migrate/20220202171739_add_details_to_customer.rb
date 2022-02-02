class AddDetailsToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :voted, :boolean
    add_column :customers, :phys_address, :string
  end
end
