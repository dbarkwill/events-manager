class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :PIN
      t.boolean :is_admin
      t.timestamps
    end
  end
end
