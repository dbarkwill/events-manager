class RemoveBarcodeFromCustomer < ActiveRecord::Migration[7.0]
  def change
    remove_column :customers, :barcode
  end
end
