class CreateCheckIns < ActiveRecord::Migration[7.0]
  def change
    create_table :check_ins do |t|
      t.integer :customer_id
      t.integer :employee_id
      t.integer :registration_id

      t.timestamps
    end
  end
end
