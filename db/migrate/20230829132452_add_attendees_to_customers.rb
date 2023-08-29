class AddAttendeesToCustomers < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :attendees, :integer
  end
end
