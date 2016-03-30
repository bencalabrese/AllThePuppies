class CreatePuppyRentalRequests < ActiveRecord::Migration
  def change
    create_table :puppy_rental_requests do |t|
      t.integer :puppy_id, null: false
      t.date :start_date, null:false
      t.date :end_date, null:false
      t.string :status, default: "PENDING", null:false

      t.timestamps null: false
    end

    add_index :puppy_rental_requests, :puppy_id
  end
end
