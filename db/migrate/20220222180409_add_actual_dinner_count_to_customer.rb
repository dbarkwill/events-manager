class AddActualDinnerCountToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :actual_dinner_count, :integer
  end
end
