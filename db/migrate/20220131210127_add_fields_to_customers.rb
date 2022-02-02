class AddFieldsToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :registered, :boolean
    add_column :customers, :dinner_count, :integer
    add_column :customers, :checked_in, :boolean
    add_column :customers, :registered_at_event, :boolean
  end
end
