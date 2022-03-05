class AddCoToCustomer < ActiveRecord::Migration[7.0]
  def change
    add_column :customers, :co, :string
  end
end
