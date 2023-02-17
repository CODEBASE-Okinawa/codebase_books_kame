class ChangeCloumnsNotnullAddReservations < ActiveRecord::Migration[7.0]
  def change
    change_column :reservations, :status, :integer, null: false
    change_column :reservations, :reserved_start, :date, null: false
    change_column :reservations, :reserved_end, :date, null: false
  end
end
