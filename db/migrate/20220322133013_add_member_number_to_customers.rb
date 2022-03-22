class AddMemberNumberToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :member_number, :integer
  end
end
