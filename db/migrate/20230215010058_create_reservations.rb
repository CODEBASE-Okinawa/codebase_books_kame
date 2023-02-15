class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.integer :user_id
      t.integer :book_id
      t.integer :status
      t.date :reserve_start
      t.date :reserve_end

      t.timestamps
    end
  end
end
