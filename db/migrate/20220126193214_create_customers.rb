class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_number
      t.string :name
      t.string :phone_number
      t.string :address
      t.boolean :registered
      t.integer :dinner_count
      t.boolean :checked_in
      t.boolean :registered_at_event
      t.boolean :voted
      t.string :phys_address
      t.timestamps
    end
  end
end
