class AddDetailsToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :IsAdmin, :boolean
  end
end
