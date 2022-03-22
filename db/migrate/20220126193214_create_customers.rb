class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :customer_number
      t.string :name
      t.string :phone_number
      t.string :address
      t.string :phys_address
      t.string :co
      t.string :empdir
      t.integer :dinner_count
      t.integer :actual_dinner_count
      t.boolean :registered
      t.boolean :checked_in
      t.boolean :registered_at_event
      t.boolean :voted
      t.timestamps
    end
  end
end