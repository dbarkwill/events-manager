class CreateRegistrations < ActiveRecord::Migration[7.0]
  def change
    create_table :registrations do |t|
      t.integer :customer_id
      t.datetime :date
      t.integer :dinner_count

      t.timestamps
    end
  end
end
